import config from './config.js';
import {validateFile,fingerprint,extract,packet,boundedExtraction} from './ingest.js';
const db=window.supabase.createClient(config.url,config.key,{auth:{storageKey:'sns-bid-intake-auth'}});
const $=id=>document.getElementById(id),message=text=>{$('message').textContent=text;};
let workspace,selected='',current=null,busy=false;
const result=async promise=>{const {data,error}=await promise;if(error)throw Error(error.message);return data;};
const command=(action,body)=>result(db.rpc('bid_intake_command',{p_action:action,p_body:body}));
const node=(tag,text,cls)=>{const n=document.createElement(tag);n.textContent=text;if(cls)n.className=cls;return n;};
const sources=()=>workspace.sources.filter(s=>s.bid_id===selected);
async function refresh(){
 workspace=await result(db.rpc('bid_intake_workspace'));$('company').textContent=workspace.company_name;
 $('workspace').hidden=false;$('login').hidden=true;$('signout').hidden=false;
 if(!workspace.bids.some(b=>b.id===selected))selected=workspace.bids[0]?.id||'';
 $('bid').replaceChildren();for(const bid of workspace.bids){const opt=node('option',bid.name);opt.value=bid.id;$('bid').append(opt);}$('bid').value=selected;render();
}
function render(){
 $('bid-content').hidden=!selected;current=null;$('detail').hidden=true;
 const list=sources(),filter=$('search').value.toLowerCase();$('sources').replaceChildren();
 for(const s of list.filter(s=>(s.name+' '+s.category).toLowerCase().includes(filter))){
  const b=node('button','', 'source'),info=node('span',s.name);info.append(node('small',`${s.category} · ${s.kind==='note'?'Pasted note':(s.byte_size/1048576).toFixed(2)+' MiB'} · ${new Date(s.created_at).toLocaleDateString()}`));b.append(info,node('span',s.status,'status'));b.onclick=()=>void handle(async()=>open(await result(db.rpc('bid_intake_source',{p_id:s.id}))));$('sources').append(b);
 }
 if(!list.length)$('sources').append(node('p','No sources yet. Add files or paste a note to begin.'));
 $('counts').replaceChildren();for(const [n,label] of [[list.length,'Sources'],[list.filter(s=>s.status==='Reviewed source').length,'Reviewed'],[list.filter(s=>['uploading','Needs extraction'].includes(s.status)).length,'Need attention']]){const item=node('span',label);item.prepend(node('strong',String(n)));$('counts').append(item);}
 const used=workspace.sources.reduce((n,s)=>n+s.byte_size,0);$('storage').textContent=`${(used/1048576).toFixed(1)} MiB of ${(workspace.byte_limit/1073741824).toFixed(1)} GiB pilot intake allowance used. Ask the engineer before increasing storage.`;
 $('coverage').replaceChildren();for(const cat of ['RFP','Drawings','Specifications','Addendum','Vendor quote','Estimate'])$('coverage').append(node('li',`${cat}: ${list.some(s=>s.category===cat)?'source provided — confirm applicability':'not provided — confirm whether needed'}`));
}
function open(s){current=s;$('detail').hidden=false;$('detail-title').textContent=s.name;$('detail-meta').textContent=`${s.category} · ${s.status} · source ${s.id} · revision ${s.revision}`;$('download').hidden=s.kind!=='file';$('extract-note').textContent=s.extraction_note||'Pasted source text; confirm its applicability.';$('review-note').value=s.review_note;$('extracted').replaceChildren();
 for(const p of s.extraction){const detail=document.createElement('details');detail.append(node('summary',p.label),node('pre',p.text));$('extracted').append(detail);}if(!s.extraction.length)$('extracted').append(node('p','No extracted text. Review the original or schedule OCR / format processing.'));
 $('finish-upload').hidden=s.status!=='uploading';$('review').querySelector('button').disabled=s.status==='uploading';$('detail').scrollIntoView({behavior:'smooth',block:'start'});
}
async function handle(fn){try{await fn();}catch(e){message(e.message||'This action could not be confirmed. Refresh before retrying.');if(!workspace)$('login').hidden=false;}}
function download(name,blob){const url=URL.createObjectURL(blob),a=document.createElement('a');a.href=url;a.download=name;document.body.append(a);a.click();a.remove();setTimeout(()=>URL.revokeObjectURL(url),60000);}
async function upload(files){
 if(busy)return message('Let this batch finish before adding another.');if(!selected)return message('Create or select the bid first.');if(files.length>100)return message('Use batches of up to 100 files.');
 const bid=selected,category=$('category').value;busy=true;$('files').disabled=true;$('bid').disabled=true;$('create').querySelector('button').disabled=true;$('queue').replaceChildren();
 try{for(const file of files){const item=node('li',`${file.name}: preparing`);$('queue').append(item);
  try{validateFile(file);const bytes=await file.arrayBuffer(),hash=await fingerprint(bytes);
   let source=await command('reserve',{id:crypto.randomUUID(),bid_id:bid,name:file.name,category,sha256:hash,byte_size:file.size});
   if(source.status!=='uploading'){item.textContent=`${file.name}: duplicate retained as ${source.name}`;continue;}
   item.textContent=`${file.name}: uploading private original`;
   const sent=await db.storage.from('sns-bid-intake').upload(source.object_path,file,{upsert:false,contentType:'application/octet-stream'});
   if(sent.error){const existing=await db.storage.from('sns-bid-intake').download(source.object_path);if(existing.error||await fingerprint(await existing.data.arrayBuffer())!==hash)throw Error(sent.error.message);}
   item.textContent=`${file.name}: extracting source text`;let extracted;
   try{extracted=await extract(file,bytes);}catch(e){extracted={pages:[],note:'Original saved; extraction could not complete. Review or OCR this document. '+String(e.message).slice(0,350)};}
   extracted=boundedExtraction(extracted);source=await command('complete',{id:source.id,expected_revision:source.revision,extraction:extracted.pages,extraction_note:extracted.note});item.textContent=`${file.name}: saved · ${source.status}`;
  }catch(e){item.textContent=`${file.name}: needs retry · ${e.message}`;}
 }await refresh();message('Batch finished. Check the per-file results and review the saved sources.');}
 finally{busy=false;$('files').disabled=false;$('bid').disabled=false;$('create').querySelector('button').disabled=false;$('files').value='';}
}
$('create').onsubmit=e=>{e.preventDefault();void handle(async()=>{const created=await command('create',{id:crypto.randomUUID(),name:$('bid-name').value});selected=created.id;await refresh();$('bid-name').value='';message('Bid created. Add its source information.');});};
$('bid').onchange=()=>{selected=$('bid').value;render();};$('search').oninput=render;$('refresh').onclick=()=>void handle(refresh);
$('files').onchange=e=>void handle(()=>upload([...e.target.files]));
for(const event of ['dragenter','dragover'])$('drop').addEventListener(event,e=>{e.preventDefault();$('drop').classList.add('over');});
$('drop').addEventListener('dragleave',()=>$('drop').classList.remove('over'));$('drop').addEventListener('drop',e=>{e.preventDefault();$('drop').classList.remove('over');void handle(()=>upload([...e.dataTransfer.files]));});
$('paste').onsubmit=e=>{e.preventDefault();void handle(async()=>{if(!selected)throw Error('Choose a bid');const text=$('note-text').value;await command('note',{id:crypto.randomUUID(),bid_id:selected,name:$('note-name').value,category:$('category').value,sha256:await fingerprint(new TextEncoder().encode(text)),byte_size:new TextEncoder().encode(text).byteLength,text});await refresh();$('paste').reset();message('Note saved with its source identity.');});};
$('review').onsubmit=e=>{e.preventDefault();void handle(async()=>{const saved=await command('review',{id:current.id,expected_revision:current.revision,review_note:$('review-note').value});await refresh();open(saved);message('Office source review recorded. Bid approval remains separate.');});};
$('finish-upload').onclick=()=>void handle(async()=>{if(busy)throw Error('Let the batch finish first.');const saved=await command('complete',{id:current.id,expected_revision:current.revision,extraction:[],extraction_note:'Original retained. Office chose manual review after interrupted extraction; review the full document.'});await refresh();open(saved);message('Original is available for manual review. If upload is unconfirmed, retry with the same file.');});
$('close-detail').onclick=()=>{$('detail').hidden=true;};
$('download').onclick=()=>void handle(async()=>{const original=await result(db.storage.from('sns-bid-intake').download(current.object_path));if(await fingerprint(await original.arrayBuffer())!==current.sha256||original.size!==current.byte_size)throw Error('Original integrity check failed. Contact the engineer.');download(current.name,original);message('Original downloaded after its hash and size matched.');});
$('export').onclick=()=>void handle(async()=>{if(busy)throw Error('Let this batch finish before exporting.');const bid=workspace.bids.find(b=>b.id===selected),rows=[];for(const source of sources())rows.push(await result(db.rpc('bid_intake_source',{p_id:source.id})));download('sns-bid-source-review.md',new Blob([packet(bid,rows)],{type:'text/markdown'}));message('Source review packet exported; prices and bid submission remain unapproved.');});
$('signout').onclick=()=>void handle(async()=>{if(busy)throw Error('Let the current batch finish before signing out.');await result(db.auth.signOut({scope:'local'}));workspace=null;selected='';current=null;$('workspace').hidden=true;$('sources').replaceChildren();$('extracted').replaceChildren();$('login').hidden=false;$('signout').hidden=true;message('Signed out. Downloaded files remain wherever you saved them.');});
await handle(async()=>{const params=new URLSearchParams(location.hash.slice(1));if(params.get('fcp_sso')==='1'&&params.get('token_hash')){const token_hash=params.get('token_hash');history.replaceState(null,'',location.pathname);await result(db.auth.verifyOtp({token_hash,type:'magiclink'}));}const {data}=await db.auth.getUser();if(!data.user){$('login').hidden=false;message('Sign in to open private SNS bid intake.');return;}await refresh();message('Company intake connected. Select a bid or start one.');});

export const MAX_FILE=50*1024*1024;
export const allowed=/\.(pdf|txt|md|csv|json|docx?|xlsx?|jpe?g|png|tiff?|eml|msg|zip|dwg|dxf)$/i;
export function validateFile(file){if(!allowed.test(file.name))throw Error('Unsupported file type; save it as a supported document or archive.');if(file.size>MAX_FILE)throw Error('File exceeds 50 MiB. Split the package or ask the engineer about larger uploads.');if(file.size===0)throw Error('Empty file.');}
export async function fingerprint(bytes){return [...new Uint8Array(await crypto.subtle.digest('SHA-256',bytes))].map(x=>x.toString(16).padStart(2,'0')).join('');}
// Bound serialized UTF-8, including JSON escaping, below the database's 750 kB limit.
export function boundedExtraction(extracted){
 const measure=pages=>new TextEncoder().encode(JSON.stringify(pages)).byteLength;
 if(measure(extracted.pages)<=700000)return extracted;
 const pages=[];for(const page of extracted.pages){let text=page.text;let lo=0,hi=text.length;
  while(lo<hi){const mid=Math.ceil((lo+hi)/2);if(measure([...pages,{...page,text:text.slice(0,mid)}])<=700000)lo=mid;else hi=mid-1;}
  if(lo>0)pages.push({...page,text:text.slice(0,lo)});if(lo<text.length)break;
 }
 return {pages,note:extracted.note+' Extraction limited by encoded size; review the original for remaining content.'};
}
export function packet(bid,sources){return `# ${bid.name}\n\nSOURCE REVIEW PACKET — not an approved estimate or bid\n\n`+sources.map(s=>`## ${s.name}\nCategory: ${s.category}\nStatus: ${s.status}\nSource ID: ${s.id}\nSHA-256: ${s.sha256}\nExtraction: ${s.extraction_note||'Text supplied / extracted'}\nOffice review: ${s.review_note||'Not reviewed'}\n\n`+s.extraction.map(p=>`### ${p.label}\n${p.text}\n`).join('\n')).join('\n');}
export async function extract(file,bytes){
 if(/\.(txt|md|csv|json|eml)$/i.test(file.name)){const full=new TextDecoder().decode(bytes);return {pages:[{label:'Text / CSV source',text:full.slice(0,250000)}],note:full.length>250000?'Text truncated at 250,000 characters; review the original.':'Plain text; CSV values and email text are not interpreted as approved facts.'};}
 if(!/\.pdf$/i.test(file.name))return {pages:[],note:'Original retained. This format requires manual review or a later document-processing worker.'};
 if(bytes.byteLength>10*1024*1024)return {pages:[],note:'Original retained. Large PDF requires a document-processing worker.'};
 const pdf=await import('/vendor/pdf.mjs');pdf.GlobalWorkerOptions.workerSrc='/vendor/pdf.worker.mjs';
 const task=pdf.getDocument({data:bytes.slice(0),isEvalSupported:false,useSystemFonts:false});
 const timer=setTimeout(()=>void task.destroy(),45000);
 try{const doc=await task.promise,pages=[];let total=0,blank=0;
  for(let i=1;i<=Math.min(doc.numPages,200);i++){const page=await doc.getPage(i),content=await page.getTextContent();const text=content.items.map(x=>x.str||'').join(' ').slice(0,20000);if(!text.trim()){blank++;continue;}const remaining=250000-total;if(remaining<=0)break;pages.push({label:`Page ${i}`,text:text.slice(0,remaining)});total+=text.length;page.cleanup();}
  const note=`PDF text is a draft extraction. ${blank} scanned/empty pages need visual review or OCR.${doc.numPages>200||total>=250000?' Extraction limit reached; review the full original.':''}`;await doc.destroy();return {pages,note};
 }finally{clearTimeout(timer);}
}

# SNS bid intake — Data dump

Live pilot: https://sns-bid-intake.vercel.app/

Sign in through JSA with the existing SNS account. Choose **Bid intake · office**, create/select the bid, upload batches or paste notes, inspect the source text/originals, record office review and export the source review packet.

## Working capabilities

Private durable originals; duplicate detection within a bid; PDF/text extraction with source references; review actor, basis and revision history; verified original download; source packet export. Company and office-role authorization run in PostgreSQL. Originals cannot be overwritten through client access. Replacements are new sources.

PDF, text/CSV/JSON/Markdown, Word/Excel, photos, email, ZIP and DWG/DXF originals are accepted. PDF.js extracts text PDFs with page references. Other formats and scanned pages retain their originals and require manual review or future processing. ZIP is not unpacked. Extraction does not approve quantities, prices or submission. Filename/category search is available; full text search is future work.

## Limits and production path

50 MiB/file, 100 files/batch, 1 GiB SNS pilot allowance. Increase the company allowance after reviewing cost and capacity. PDF extraction runs in the browser and is bounded at 10 MiB, 200 pages, 250,000 characters and 45 seconds; larger originals still save. Extraction may omit layout/tables/scans. Failed reservations remain visible and reserve capacity; retry the same bytes to resume. Cancellation, server pagination and high-volume background processing remain future work. The register loads metadata; content loads per source.

This is the bid desk's input foundation. Structured bid requirements, scope/exclusions, deadlines, addendum reconciliation, vendor comparison, pricing and named approval are the next build. Connect DrawIQ quantities with drawing revision and calibration evidence. Do not classify the full Steel Away estimating workflow as production from this intake release.

## Useful open source

- [PDF.js](https://github.com/mozilla/pdf.js), Apache-2.0: included for text PDFs.
- [Docling](https://github.com/docling-project/docling), MIT code: candidate for mixed-format packages and tables. Check selected model licenses separately. Run a bounded background worker and retain page/sheet references.
- [OCRmyPDF](https://github.com/ocrmypdf/OCRmyPDF), MPL-2.0 plus dependency licenses: candidate for scanned PDFs. Save OCR output as a derived file; retain originals.
- [ExcelJS](https://github.com/exceljs/exceljs), MIT: candidate for existing estimating sheets and vendor quotes with sheet/cell references. Preserve units, currencies and formula/value distinctions for estimator reconciliation.

Reuse existing source material and estimating work before adding another subscription. Measure missing-source follow-ups, duplicate entry, review turnaround and estimator acceptance before claiming savings.

## Development, release and QA

Node 22+. `npm ci`, `npm test`, `node test/backend.mjs`, `npm run build`. Set the two public Supabase variables in `.env.example`; no service keys ship. Vercel serves `dist/`. Apply versioned migrations with the authorized migration tool. Company activation defaults off and must be explicit.

Isolated PostgreSQL checks cover original completion, duplicate identity, revision conflicts, budget, tenant, office role, anonymous denial and source-detail isolation. Live SNS setup checks verify private storage round-trip, original hash, duplicate identity and anonymous download denial. Records are labeled SYSTEM CHECK ONLY.

Private internal tables intentionally have RLS without direct client policies; narrow authorized RPCs own access. No new anonymous definer RPC is exposed. Existing project-wide advisor warnings belong to separate functions and were not changed; [advisor guidance](https://supabase.com/docs/guides/database/database-linter).

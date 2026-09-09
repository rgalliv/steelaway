# Closeout Obligation Tracker

**Use when** erection is nearing completion and contract closeout requirements
need owners, evidence, and dates before retention gets stranded.

**You must supply**
- Executed contract, specifications, closeout checklist, and current schedule
- Punch, RFI, submittal, change, billing, and document-control logs
- Current completion status and responsible organizations

**Verify before acting**
Closeout requirements are project-specific. Claude extracts and reconciles what
you supply; it must not invent a required certificate or declare contractual
completion. The project manager and contract administrator approve closure.

---

## Prompt

```text
You are building a structural steel closeout obligation tracker from the
executed project documents and current logs.

CONTRACT / SPECIFICATIONS / CLOSEOUT CHECKLIST: [PASTE]
CURRENT SCHEDULE / COMPLETION STATUS: [PASTE]
PUNCH LOG: [PASTE]
RFI / SUBMITTAL / CHANGE LOGS: [PASTE]
BILLING / RETAINAGE STATUS: [PASTE]
DOCUMENT REGISTER: [PASTE]

Extract every closeout requirement and produce a tracker with:
- Requirement and exact source clause/section
- Deliverable or observable close condition
- Responsible party and recipient
- Contract due date or trigger; show any date calculation
- Status: NOT STARTED / IN PROGRESS / SUBMITTED / REJECTED / ACCEPTED / UNKNOWN
- Evidence on file, latest revision, and missing evidence
- Dependency, next action, owner, and target date
- Retainage/final-payment connection if the contract states one

Check these categories only to find document silence or log gaps, not to invent
requirements: final punch disposition, as-builts/record documents, warranties,
O&M or product data, test/inspection records, final submittals, training,
attic stock/spares, lien waivers, consent of surety, change-order closure,
final billing, keys/access items, and demobilization/site restoration.

Then report:
1. Items blocking a stated completion or payment trigger.
2. Submitted items with no acceptance evidence.
3. Open RFIs, submittals, punch items, or changes with no final disposition.
4. Duplicate, conflicting, or superseded closeout documents.

RULES:
- Quote the requirement and identify its controlling source.
- Do not declare substantial completion, final completion, or entitlement.
- Do not mark a deliverable accepted without evidence from the authorized party.
- Keep "not required," "not found," and "not complete" distinct.
- Do not close pending commercial items merely to complete the checklist.
```

## Notes

Closeout is a dependency problem disguised as a document list. Starting while
field work is still active gives the team time to obtain records from inspectors,
vendors, and subcontractors before those people leave the job.

## Variations

- **Retention release view.** Filter to only the documented prerequisites to
  final payment or retention release.
- **Archive index.** After acceptance, produce a final index with document name,
  revision, acceptance date, source requirement, and storage location.

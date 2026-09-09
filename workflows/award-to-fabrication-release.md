# Workflow: Award to Fabrication Release

**Spans** executed award → controlled release to detailing, procurement, and fabrication.
**You still own** Contract interpretation, technical approvals, release authority,
and every commitment made to the shop or client.

---

## Step 1 — Establish the awarded baseline

Collect the executed agreement, incorporated documents, proposal, exclusions,
addenda, post-bid clarifications, and current drawing/specification index.

Run [`scope-gap-analysis.md`](../prompts/contracts/scope-gap-analysis.md) with the
proposal and executed contract. Carry forward every exclusion or assumption that
did not survive into the award.

## Step 2 — Build the risk and obligation register

Run [`subcontract-risk-review.md`](../prompts/contracts/subcontract-risk-review.md),
then convert its confirmed operational obligations into the project risk register
with [`bid-risk-register.md`](../prompts/estimating/bid-risk-register.md).

Rename the artifact **Award Risk Register**. Preserve each contract citation;
do not carry over bid assumptions as awarded facts.

## Step 3 — Confirm document control

```text
Here is the awarded document list and the files currently distributed to the
project team.

Build a document-control reconciliation: contract-listed document, required
revision/date, file received, file revision/date, status MATCH / MISSING /
CONFLICT / SUPERSEDED, distribution owner, and action. Do not choose between
conflicting documents. Draft the exact question needed to resolve each conflict.

[PASTE CONTRACT DOCUMENT LIST]
[PASTE DISTRIBUTED FILE INDEX]
```

No release proceeds from a MISSING, CONFLICT, or SUPERSEDED technical basis.

## Step 4 — Create the submittal and decision map

Run [`submittal-log-triage.md`](../prompts/project-mgmt/submittal-log-triage.md).
Add required delegated-design inputs, samples, finish selections, and connection
criteria from the awarded documents. Assign the person who supplies each input
and the date it must be available to protect detailing and procurement.

## Step 5 — Define milestone and release dates

Run [`delivery-and-milestone-plan.md`](../prompts/project-mgmt/delivery-and-milestone-plan.md)
using the contract milestones and proposed erection sequence. Work backward only
with durations supplied by the responsible shop, supplier, carrier, and field team.

## Step 6 — Hold the release gate

```text
Using the registers in this conversation, create a fabrication-release gate by
lot or area. A lot may be READY only when the evidence shows:
- governing revision identified and distributed
- required technical approvals complete
- unresolved RFIs classified for effect on that lot
- material/specification/finish basis confirmed
- procurement and shop capacity commitments documented
- inspection or hold points identified
- delivery sequence and need date identified
- named person authorized to release it

For each criterion show PASS / HOLD / NOT APPLICABLE / UNKNOWN, the evidence,
and owner. Do not infer approval and do not issue the release.
```

## Step 7 — Human authorization

The authorized project and fabrication personnel resolve every HOLD and sign the
company's actual release record. Save the register snapshot with that record so
the revision basis is reconstructable later.

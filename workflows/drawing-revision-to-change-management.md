# Workflow: Drawing Revision to Change Management

**Spans** revised design document received → technical routing, notice, pricing,
and approved execution basis documented.
**You still own** Interpretation, notice decisions, entitlement, pricing,
technical approval, and direction to proceed.

---

## Step 1 — Control the revision

Log the issue date, received date, source, revision, affected sheets/specifications,
and recipients. Do not overwrite the prior revision in the working comparison set.

## Step 2 — Compare and map the delta

Run [`drawing-revision-impact.md`](../prompts/project-mgmt/drawing-revision-impact.md)
with both revisions and live detailing, procurement, fabrication, and field status.
Resolve every UNKNOWN impact state with the responsible team.

## Step 3 — Protect notice dates

Run [`notice-deadline-tracker.md`](../prompts/contracts/notice-deadline-tracker.md)
for the revision event. Route ambiguous triggers and clause conflicts to the
authorized contract administrator or counsel.

If the team elects to notify, draft the project-specific communication using the
actual contract requirements. Do not wait for complete pricing if the contract
requires earlier notice.

## Step 4 — Form the technical question

For conflicts, missing criteria, or unclear intent, run
[`rfi-drafting.md`](../prompts/project-mgmt/rfi-drafting.md). Separate the technical
question from the commercial reservation. The EOR answers the technical question;
the contract process handles time and money.

## Step 5 — Quantify only the documented delta

```text
Using the approved technical response and the impact log, build a quantity and
cost-input worksheet. Separate:
1. deleted baseline work
2. added work
3. changed work not yet started
4. rework supported by status evidence
5. material cancellation/restocking supported by vendor documentation
6. schedule, remobilization, or disruption effects requiring separate proof

For each line cite the baseline, revised requirement, quantity source, status
evidence, and pricing source. Do not invent quantities, rates, productivity loss,
or causation. Mark unsupported items OPEN.
```

## Step 6 — Draft the change record

Run [`change-order-narrative.md`](../prompts/contracts/change-order-narrative.md)
using the baseline, direction, notices, technical response, and supported cost
worksheet. Keep entitlement, quantum, and schedule effect as separate sections.

## Step 7 — Close the loop

After written disposition, update the drawing register, RFI log, change log,
purchase orders, shop/field instructions, fabrication-release basis, delivery
plan, forecast, and billing. Run a final check for any downstream record still
pointing to the superseded revision.

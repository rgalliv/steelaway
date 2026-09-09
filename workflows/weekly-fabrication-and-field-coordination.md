# Workflow: Weekly Fabrication and Field Coordination

**Spans** one recurring coordination cycle across detailing, shop, transport,
and erection.
**Cadence** Weekly, with a short daily exception update on fast work.

---

## Step 1 — Refresh source data

Use current exports for drawings/submittals, RFIs, procurement, fabrication,
quality holds, delivery manifests, erection progress, field issues, and the
milestone forecast. Record each export time and revision so stale reports remain
visible.

## Step 2 — Find the actual fabrication constraints

Run [`fabrication-status-recovery.md`](../prompts/project-mgmt/fabrication-status-recovery.md).
Carry forward only observable status, documented blockers, and commitments made
by the responsible owner.

## Step 3 — Reconcile the next delivery waves

Run [`delivery-and-milestone-plan.md`](../prompts/project-mgmt/delivery-and-milestone-plan.md),
then apply [`delivery-and-laydown-coordination.md`](../prompts/field-ops/delivery-and-laydown-coordination.md)
to each load expected in the next three weeks.

Do not dispatch from this workflow. The fabricator, carrier, and site confirm the
actual release and arrival window.

## Step 4 — Triage decisions and open questions

Run [`submittal-log-triage.md`](../prompts/project-mgmt/submittal-log-triage.md) and
review open field issues created with
[`field-issue-report.md`](../prompts/field-ops/field-issue-report.md).

```text
Combine the open submittal, RFI, and field-issue records. Identify duplicate
questions, conflicting required-by dates, items with no decision owner, and any
answer that has not been incorporated into downstream drawings or instructions.
Preserve each original record ID and do not merge issues that require different
authorized decisions.
```

## Step 5 — Test the near-term erection interface

Run [`erection-sequence-review.md`](../prompts/project-mgmt/erection-sequence-review.md)
on any changed sequence. For a planned lift requiring a lift-plan package, run
[`lift-plan-readiness-review.md`](../prompts/field-ops/lift-plan-readiness-review.md)
only as a document and coordination check for the pre-lift meeting.

## Step 6 — Publish the weekly control board

```text
From this conversation, produce a one-page weekly control board:
- milestone forecast changes since last week
- deliveries in the next three weeks and their confirmation status
- the five constraints most likely to stop the next sequence
- commitments due before the next meeting, with owner and exact date
- decisions required, naming the authorized role
- new revision, commercial-notice, quality, or safety-coordination exceptions

Every line must cite its source record. Separate FACT, COMMITMENT, PROPOSAL, and
UNKNOWN. Do not call work safe, approved, released, or complete without evidence.
```

## Step 7 — Close commitments

Issue meeting records through the company's normal system. At the next cycle,
start with the prior commitment list and record DONE / LATE / REVISED / DISPUTED,
including who changed a date and when.

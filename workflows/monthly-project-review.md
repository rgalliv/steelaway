# Workflow: Monthly Project Review

**Spans** a recurring one-to-two hour health check on an active project.
**Cadence** Monthly, or every two weeks on a fast job.

---

## Step 1 — Submittals

Run [`submittal-log-triage.md`](../prompts/project-mgmt/submittal-log-triage.md).
Carry forward: what is blocking fabrication, and what is overdue with the reviewer.

## Step 2 — Change order status

```text
Here is my change order log: [PASTE — number, description, amount, date
submitted, status, date of last action].

TODAY: [DATE]
CONTRACT: pricing response due within [N] days of submission.

Report:
1. Submitted and unanswered beyond the contract response period, with days over.
2. Approved but not yet in a payment application.
3. Work directed and performed with no COR submitted — unbilled exposure.
4. Rejected with no follow-up.
5. Total value: approved, pending, rejected, and unsubmitted-but-performed.

Show the arithmetic on anything you call late or exposed.
```

Category 3 is the one that quietly grows. Work performed without a COR is money
already spent and not yet claimed.

## Step 3 — Scope drift

Re-run [`scope-gap-analysis.md`](../prompts/contracts/scope-gap-analysis.md)
against current drawing revisions. Revisions issued since award routinely add
scope that nobody logged as a change.

## Step 4 — Schedule position

```text
CONTRACT MILESTONES: [DATES]
CURRENT FORECAST: [DATES]
DELAYS TO DATE: [DESCRIPTION, DURATION, CAUSE, NOTICE GIVEN]
CONTRACT: notice of delay required within [N] days; LDs of [AMOUNT] per day.

Report:
1. Milestones at risk, with days of slip.
2. Delays where notice appears not to have been given within the required period.
3. Delays with no documented cause — these are the ones that get charged to me
   by default.
4. Current LD exposure if the forecast holds.
5. What documentation would need to exist to support a time extension request,
   and what of it I appear to be missing.
```

## Step 5 — Consolidate

```text
From everything in this conversation, write a one-page internal summary:
- The three largest risks, each with the specific action that reduces it
- Total commercial exposure: unbilled work, LD risk, unpriced scope
- What I owe others this month, and what others owe me
- What needs a decision from someone above me

Facts only. This is for my own management, not the client.
```

# Workflow: Project Closeout

**Spans** approaching field completion → accepted records, commercial closure,
and final archive.
**Start** Before the erection crew demobilizes, while evidence and responsible
people are still available.

---

## Step 1 — Extract the contractual finish line

Run [`closeout-obligation-tracker.md`](../prompts/contracts/closeout-obligation-tracker.md)
against the executed contract, specifications, and GC closeout checklist. Keep
contract-required items separate from company archive preferences.

## Step 2 — Reconcile open technical records

```text
Review the punch, field issue, NCR, inspection, RFI, and submittal logs. For
each open or unclear item, report the final disposition document required, the
authorized party who provides or accepts it, current evidence, owner, and target
date. Distinguish physical completion from documentation acceptance.

Do not infer acceptance from silence and do not close a technical item based on
a commercial settlement unless the record expressly does so.
```

Use [`punch-list-writeup.md`](../prompts/field-ops/punch-list-writeup.md) to make
remaining observations assignable and location-specific.

## Step 3 — Reconcile commercial records

Run [`notice-deadline-tracker.md`](../prompts/contracts/notice-deadline-tracker.md)
one final time for unresolved events. Reconcile pending/approved changes,
back-charges, deductions, and allowances with the executed contract value.

Run [`pay-application-backup-review.md`](../prompts/contracts/pay-application-backup-review.md)
for the final application. Do not fold disputed or pending change value into the
executed contract value.

## Step 4 — Assemble the turnover package

```text
Using only accepted or verified records, create a turnover index grouped by the
contract's required categories. For each file show requirement source, document
title, identifier, revision, date, responsible organization, acceptance evidence,
and storage location. Flag duplicates, superseded revisions, broken references,
and requirements with no file.
```

Do not rename source records in a way that breaks traceability. If the client
requires a naming convention, record both the source name and delivery name.

## Step 5 — Confirm payment prerequisites

Filter the closeout tracker to contract language tied to final payment or
retainage release. Obtain the required acceptance or delivery evidence from the
authorized recipient. Route lien-waiver, surety, or legal-form questions to the
appropriate professional.

## Step 6 — Capture lessons without changing the record

```text
From the final project logs, draft a lessons-learned register with: observed
event, objective evidence, effect, root-cause status (CONFIRMED / HYPOTHESIS),
repeatable action, proposed owner, and the estimating or execution template that
should change. Do not assign blame and do not convert correlation into causation.
```

## Step 7 — Archive

After authorized acceptance, export the final indexes and preserve the executed
contract, baseline/revision history, approvals, final logs, correspondence,
commercial records, and turnover evidence under the company's retention policy.

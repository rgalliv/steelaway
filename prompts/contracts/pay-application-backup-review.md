# Pay Application Backup Review

**Use when** assembling or checking a monthly pay application before submission.

**You must supply**
- Executed schedule of values and current application form
- Prior certified application and payment received
- Current quantities/progress approved by responsible project personnel
- Stored-material records, approved changes, retainage rules, and required backup

**Verify before acting**
Claude may reconcile documents and arithmetic. It cannot certify percent complete,
title to stored material, lien-waiver language, or payment entitlement. Accounting
and the project manager approve every submitted value.

---

## Prompt

```text
You are reconciling a structural steel pay application package. Do not create or
approve progress values that I have not supplied.

SCHEDULE OF VALUES: [PASTE]
CURRENT APPLICATION: [PASTE]
PRIOR CERTIFIED APPLICATION: [PASTE]
PAYMENT RECEIVED: [PASTE]
APPROVED PROGRESS / QUANTITIES: [PASTE]
STORED-MATERIAL RECORDS: [PASTE]
APPROVED CHANGE ORDERS: [PASTE]
CONTRACT PAYMENT / RETAINAGE / BACKUP TERMS: [PASTE]

Perform:

1. ROLL-FORWARD — prior completed-and-stored, current-period amount, current
   completed-and-stored, retainage, prior certificates, and amount due. Show the
   arithmetic and identify the source for every input.
2. SOV CONTROL — confirm line IDs and original values match the executed schedule;
   flag unauthorized line additions, reallocation, or overbilling.
3. PROGRESS SUPPORT — map each current-period value to supplied quantity,
   milestone, approved status, timesheet, delivery, or other evidence. Mark rows
   with no support.
4. STORED MATERIAL — list location, invoice, proof of payment/title, insurance,
   identification, approval, and prior billing status only when supplied.
5. CHANGE CONTROL — include only executed/approved changes in contract value;
   list pending CORs separately so they do not disappear.
6. PACKAGE CHECK — required forms, waivers, payroll, supplier backup, photos,
   certifications, and submission deadline from the supplied contract.

Output a reconciliation table, exception list, and submission checklist.

RULES:
- Do not estimate percent complete or convert fabrication status into billing.
- Do not treat a pending COR as an approved contract-value change.
- Preserve conditional/unconditional waiver wording for legal review.
- Do not invent stored-material ownership, delivery, or insurance evidence.
- Flag arithmetic and documentation issues; accounting decides the correction.
```

## Notes

The strongest package ties each billed value to a traceable status or record.
That shortens review and makes underpayment easier to identify without turning
the application itself into a commercial argument.

## Variations

- **GC reconciliation.** Compare the submitted, certified, and paid amounts by
  line and list unexplained reductions or timing differences.
- **Cash forecast.** Using only approved billing and supplied payment terms,
  calculate expected receipts by scenario and label every date assumption.

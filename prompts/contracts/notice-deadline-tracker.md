# Notice Deadline Tracker

**Use when** the contract contains short notice periods and the project needs a
repeatable way to keep potential changes and delays from expiring silently.

**You must supply**
- Executed contract and incorporated change/claim/notice provisions
- Event log with dates, knowledge dates, direction, and correspondence
- Project calendar and any defined business-day rules
- Existing notices and delivery evidence

**Verify before acting**
This template performs document extraction and date arithmetic, not legal advice.
Counsel or the authorized contract administrator determines which clause applies,
whether a notice is sufficient, and whether rights were preserved.

---

## Prompt

```text
You are building a notice deadline tracker from an executed structural steel
subcontract. I will have counsel or the contract administrator review it.

CONTRACT / INCORPORATED TERMS: [PASTE]
EVENT LOG: [PASTE — EVENT DATE, DATE KNOWN, DESCRIPTION, DIRECTION]
PROJECT CALENDAR / DAY DEFINITIONS: [PASTE]
NOTICES ALREADY SENT: [PASTE WITH DELIVERY EVIDENCE]
TODAY: [DATE]

First extract each notice clause verbatim into a clause table:
- Notice type or triggering event
- Exact trigger language
- Time period and calendar/business-day basis
- Recipient, address/system, delivery method, and required content
- Consequence stated in the contract
- Clause and incorporated-document reference

Then create an event tracker:
- Event and factual date(s)
- Potentially applicable clause — mark REQUIRES LEGAL REVIEW where ambiguous
- Earliest plausible trigger date and why
- Calculated deadline, showing arithmetic and calendar used
- Notice status: NOT STARTED / DRAFT / SENT / DELIVERY UNVERIFIED / ACKNOWLEDGED
- Evidence available and missing
- Owner and next action

End with deadlines in the next 3, 7, 14, and 30 days, plus events that may
already be late. Say POTENTIALLY LATE; do not conclude that rights are waived.

RULES:
- Quote, do not paraphrase, the operative contract language.
- Never invent a day-count rule, recipient, address, delivery method, or deadline.
- If trigger or calendar basis is unclear, calculate each plausible case separately.
- Do not state enforceability, waiver, entitlement, or legal sufficiency.
- Keep contractual notice separate from ordinary project correspondence.
```

## Notes

The earliest plausible trigger protects the decision window without pretending
the legal question is settled. The team can issue a timely protective notice or
take the ambiguity to counsel while the record is still fresh.

## Variations

- **Weekly review.** Return only new events, approaching deadlines, notices with
  missing delivery evidence, and items waiting on counsel.
- **Notice audit.** Compare sent notices with clause requirements field by field;
  mark differences for review rather than declaring a notice invalid.

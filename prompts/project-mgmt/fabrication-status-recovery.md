# Fabrication Status Recovery

**Use when** fabrication is slipping, the status report is noisy, or the project
team cannot agree on what is actually blocking release and shipment.

**You must supply**
- Mark-level or lot-level status from detailing through shipment
- Current approved-for-fabrication information and revision basis
- Open submittals, RFIs, material shortages, NCRs, and inspection holds
- Required delivery sequence and milestone dates

**Verify before acting**
Status systems describe work; they do not prove completion. The responsible
detailer, shop manager, quality team, and project manager confirm each recovery
commitment. Claude organizes dependencies and exposes unsupported dates.

---

## Prompt

```text
You are turning structural steel fabrication status into a recovery action plan.

STATUS DATA: [PASTE — MARK/LOT, CURRENT STEP, QTY, REVISION, DATES]
APPROVED-FOR-FABRICATION BASIS: [LIST]
OPEN SUBMITTALS / RFIs: [PASTE]
MATERIAL / VENDOR STATUS: [PASTE]
QUALITY / INSPECTION HOLDS: [PASTE]
REQUIRED DELIVERY SEQUENCE: [PASTE]
MILESTONES: [PASTE]

Produce:

1. STATUS NORMALIZATION — map each item to NOT RELEASED / RELEASED / MATERIAL
   AVAILABLE / IN FABRICATION / QUALITY HOLD / COMPLETE / SHIPPED / UNKNOWN.
   Preserve the source status beside your normalized value.
2. BLOCKER REGISTER — item, blocking condition, source evidence, owner, next
   action, promised date, and downstream deliveries affected.
3. SEQUENCE TEST — compare forecast completion and shipment with the required
   delivery sequence. List missing predecessors and out-of-sequence lots.
4. DATE QUALITY — identify dates with no stated basis, conflicts between reports,
   overdue commitments, and items with no next date.
5. RECOVERY BOARD — actions for the next 48 hours, 7 days, and 30 days. Do not
   assign a commitment the named owner did not make; mark PROPOSED.
6. MANAGEMENT DECISIONS — overtime, resequencing, alternate sourcing, partial
   release, or commercial escalation decisions raised by the facts. Do not make
   the decision.

RULES:
- Do not infer percent complete from a status label.
- Do not treat an unapproved technical item as released.
- Do not manufacture finish dates or production rates.
- Distinguish a documented blocker from a suspected blocker.
- Keep technical, material, quality, and commercial holds separate.
```

## Notes

A recovery plan is credible only when dates have owners and evidence. "In the
shop" is location, not status; "90% complete" is not a deliverable. Normalize
to observable states and make the next constraint visible.

## Variations

- **Daily stand-up.** Return only new blockers, slipped commitments, items due in
  seven days, and decisions needed today.
- **Two-fabricator program.** Add a fabricator field and identify sequence gaps
  at the interface without ranking vendor performance unless data supports it.

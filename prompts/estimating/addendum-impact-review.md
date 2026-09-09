# Addendum Impact Review

**Use when** an addendum lands during bidding and you need to find every place
it changes the number, scope, schedule, or submission package.

**You must supply**
- The addendum, including its attachments and revised drawing list
- The prior drawing/specification index and the revision you priced
- Your current takeoff, vendor requests, proposal draft, and bid due date

**Verify before acting**
An addendum can change a detail without changing the sheet title. Claude can
build the comparison and action list, but the estimator must open every revised
sheet and specification section before accepting a quantity or scope conclusion.

---

## Prompt

```text
You are reviewing a bid addendum for a structural steel package. I am the
estimator; I own the scope, quantities, and price.

ADDENDUM: [PASTE OR ATTACH]
PRIOR DOCUMENT INDEX: [PASTE]
CURRENT TAKEOFF / BID NOTES: [PASTE]
OPEN VENDOR REQUESTS: [PASTE]
CURRENT PROPOSAL: [PASTE]
BID DUE: [DATE, TIME, TIME ZONE]

Build an addendum impact register with one row per changed item:

1. SOURCE — addendum item, sheet, detail, specification section, or schedule.
2. DOCUMENT DELTA — what the new document shows versus the prior revision.
   Quote or cite both sides. If the prior document is missing, mark UNVERIFIED.
3. LIKELY IMPACT AREA — quantity, material, connection/detailing, finish,
   delegated design, procurement, fabrication, erection, commercial term, or
   submission requirement.
4. ACTION — recount, reprice, obtain vendor revision, issue pre-bid RFI, revise
   exclusion, update schedule assumption, or acknowledge only.
5. OWNER AND DEADLINE — who must act and the latest useful completion time.
6. STATUS — OPEN / WAITING / VERIFIED / INCORPORATED.

Then report separately:
- Revised sheets listed but not supplied
- Supplied sheets whose revision is not reflected in the document index
- Changes with no traceable effect on my current takeoff or proposal
- Vendor quotes that may now be stale
- Addendum acknowledgments or bid forms that must be included at submission

RULES:
- Do not infer a quantity change from narrative alone. Identify the recount area.
- Do not claim a sheet is unchanged unless both revisions were supplied.
- Preserve exact drawing, detail, and specification references.
- Distinguish CONFIRMED DELTA from POSSIBLE IMPACT.
- Do not change my price. Produce the action register; I decide the adjustment.
```

## Notes

The highest-risk line is often not a visible framing change. A revised coating
section, completion date, or delegated-design requirement can move the bid more
than one added beam. Keep commercial and submission changes in the same register
as drawing changes so none disappear between reviewers.

## Variations

- **Multiple addenda.** Ask for one cumulative register and a conflict list when
  a later addendum supersedes an earlier instruction.
- **Post-bid audit.** Compare the final proposal package with the register and
  list every OPEN item that was not incorporated or expressly excluded.

# Drawing Revision Impact

**Use when** a new drawing or specification revision is issued after award and
you need to trace technical, schedule, and commercial consequences.

**You must supply**
- Both prior and current revisions, including revision narratives and clouds
- Current shop/erection drawing status, procurement status, and fabrication log
- Contract baseline documents and change-notice requirements

**Verify before acting**
Claude can compare supplied documents and route questions. It cannot determine
structural adequacy or approve a change. A detailer or engineer validates
technical interpretation; the project manager validates entitlement and notice.

---

## Prompt

```text
You are comparing post-award structural documents and building an impact log.

PRIOR REVISION: [ATTACH / PASTE]
CURRENT REVISION: [ATTACH / PASTE]
BASELINE CONTRACT DOCUMENTS: [LIST]
SHOP / ERECTION DRAWING STATUS: [PASTE]
PROCUREMENT / FABRICATION STATUS: [PASTE]
FIELD STATUS: [PASTE]
CHANGE AND NOTICE TERMS: [QUOTE CONTRACT CLAUSES]

For each visible or stated delta, report:
1. Exact source: sheet/detail/specification and both revision identifiers.
2. Before and after, with document language or values kept separate.
3. Affected marks, areas, submittals, purchase orders, fabrication lots,
   deliveries, or installed work supported by my status data.
4. Impact state: NOT STARTED / DETAILED / SUBMITTED / APPROVED / ORDERED /
   FABRICATED / SHIPPED / INSTALLED / UNKNOWN.
5. Required technical review owner: detailer / connection engineer / EOR /
   fabricator / erector / supplier.
6. Possible cost or schedule category, marked POTENTIAL until verified.
7. Contract notice deadline calculated from the supplied clause and issue date.
8. Evidence and action needed to close the row.

Then identify:
- Revision clouds or narratives that do not reconcile with visible changes
- Changed sheets with no prior revision supplied
- Downstream records that still reference the superseded revision
- Changes already incorporated without a documented direction or commercial log

RULES:
- Do not decide whether a technical change is acceptable.
- Do not state entitlement. Identify the documented baseline and delta.
- Do not call work rework unless my status data shows it was already completed.
- Show all date arithmetic and preserve the contract's exact notice language.
- If two drawings conflict, draft the question; do not choose one.
```

## Notes

The impact state prevents every drawing change from being treated alike. A delta
found before detailing is not the same event as the same delta found after steel
is installed, even when the technical change is identical.

## Variations

- **Bulletin package.** Run across every sheet in an ASI or bulletin and group
  common impacts without losing individual sheet references.
- **Revision audit.** Compare the current field set, detailer set, and fabricator
  set and list where revision control has diverged.

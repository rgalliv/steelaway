# Field Issue Report

**Use when** the field encounters a fit-up, damage, missing-material, drawing, or
access problem that needs a complete record and a clear routing decision.

**You must supply**
- Observation, exact location, affected marks, date/time, and who observed it
- Photos, measurements, drawing/detail references, and current revisions
- Immediate work status and any direction already received

**Verify before acting**
Claude can organize facts and draft routing documents. It cannot diagnose a
structural problem, authorize repair, assign responsibility, or direct work.
Measurements and photos must be confirmed by the person who collected them.

---

## Prompt

```text
You are turning field notes into a structural steel field issue report. Report
only what the supplied evidence supports.

OBSERVATION: [PASTE]
LOCATION / MARKS: [GRID, LEVEL, MEMBER MARKS]
DATE / TIME / OBSERVER: [PASTE]
PHOTOS / MEASUREMENTS: [ATTACH OR LIST]
DRAWINGS / DETAILS / REVISIONS: [PASTE]
WORK STATUS: [NOT STARTED / IN PROGRESS / HELD / INSTALLED]
DIRECTION RECEIVED: [WHO, WHEN, EXACT WORDS OR DOCUMENT]

Draft:

1. SUBJECT — searchable issue name with location and affected mark.
2. OBSERVED CONDITION — facts only, separating direct observation, measurement,
   document requirement, and reported statement.
3. DOCUMENT BASIS — every referenced sheet/detail and revision. Identify missing
   or conflicting references.
4. CURRENT STATUS — affected work, area isolated or held if my notes say so,
   downstream work waiting, and who was notified.
5. EVIDENCE INDEX — photo/file ID, viewpoint or subject, timestamp if supplied,
   and the fact it supports.
6. ROUTING — RFI / NCR / damage report / shortage report / coordination item /
   potential change. Explain the routing rationale without deciding causation.
7. OPEN QUESTIONS — questions the EOR, fabricator, detailer, GC, inspector, or
   supplier must answer.

RULES:
- Do not label a condition defective, nonconforming, or unsafe unless the cited
  source or authorized person has done so. State what was observed.
- Do not propose or describe a repair, force-fit, modification, or acceptance.
- Do not assign fault, cost, schedule responsibility, or entitlement.
- Preserve supplied measurements exactly and include their stated method.
- If work proceeded, record the supplied authorization; never invent one.
```

## Notes

Separating observations from conclusions protects the record. "Hole center is
3/4 in. from the dimension shown on detail X" is evidence; "fabricated wrong" is
a conclusion that requires document control and authorized review.

## Variations

- **RFI conversion.** Feed the approved issue report into `rfi-drafting.md` and
  preserve its evidence references.
- **Issue-log rollup.** Group reports by status and owner, then flag held work,
  unanswered questions, and issues with no final disposition document.

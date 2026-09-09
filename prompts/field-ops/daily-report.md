# Daily Report

**Use when** turning a day's field notes into a report that will hold up if the
project goes sideways.

**You must supply**
- Raw notes: crew, hours, work performed, location, equipment
- Weather, including anything that stopped or slowed work
- Delays, interferences, visitors, inspections, deliveries
- Anything unusual — this is the part that matters later

**Verify before acting**
The report is a contemporaneous record and may become evidence. The
superintendent who was there confirms every fact before it is filed. Do not let
Claude smooth over a gap in your notes with plausible narrative.

---

## Prompt

```text
You are formatting field notes into a structural steel daily report. I was on
site; you were not. Report only what my notes support.

DATE: [DATE]
PROJECT: [NAME / NUMBER]
RAW NOTES:
[PASTE — unstructured is fine]

Produce a daily report with these sections:

1. MANPOWER — crew by classification, headcount, hours. Total man-hours.
2. WORK PERFORMED — by area or grid, specific about what was placed, bolted,
   welded, plumbed, or decked. Quantities where my notes give them.
3. EQUIPMENT — on site, and whether operating, idle, or down.
4. WEATHER — conditions, and specifically whether they affected work.
5. DELIVERIES — what arrived, from whom, condition, and whether it was inspected.
6. DELAYS AND INTERFERENCES — what stopped or slowed work, duration, cause, and
   who was notified. This section is the reason the report exists; be specific
   and factual.
7. VISITORS AND INSPECTIONS — who, from what organization, purpose, outcome.
8. SAFETY — toolbox talk topic, incidents, near misses, observations.
9. NOTES FOR THE RECORD — anything unusual that may matter later.

RULES:
- Do not invent, infer, or round any fact my notes do not contain. If a section
  has nothing, write "None reported" — do not fill it.
- Keep delay entries factual: what happened, when, how long, who was told. No
  characterization of fault, no commercial argument.
- Preserve my quantities and times exactly. Do not convert or estimate.
- At the end, list GAPS: fields a complete daily report would carry that my notes
  did not cover, so I can fill them from memory today rather than reconstructing
  them in a year.
```

## Notes

The GAPS list is the point of running this at all. Daily reports get thin exactly
when the day was chaotic — which is the day you will later need it to be
detailed. Filling gaps the same afternoon is the whole discipline.

"No characterization of fault" is not softness. A delay entry that says another
trade "failed to" or "refused to" is an argument; one that says the area was
occupied from 0900 to 1330 and the GC superintendent was notified at 0915 is a
fact. Facts survive cross-examination.

## Variations

- **Delay-focused.** Add: "Expand section 6 into a standalone delay record with
  a timeline, the notification chain, and the crew and equipment idled."
- **Weekly rollup.** Paste seven reports and ask for a summary with total
  man-hours, work completed by area, and every delay carried forward.

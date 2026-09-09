# Labor and Production Assumptions

**Use when** translating a takeoff and execution plan into explicit labor and
production assumptions before pricing.

**You must supply**
- Quantities grouped by work type, member type, area, or sequence
- Your own historical production rates or estimating factors
- Crew composition, shifts, work calendar, and known site constraints
- Scope boundaries for shop and field work

**Verify before acting**
Claude does not know your shop, crew, equipment, labor agreement, or actual
production. It may organize and apply the rates you supply; it must not invent
industry rates. The estimator validates every factor against company history and
the project execution plan.

---

## Prompt

```text
You are organizing labor and production assumptions for a structural steel bid.
Use only the quantities and production factors I provide.

PROJECT / PACKAGE: [DESCRIPTION]
QUANTITIES: [PASTE TABLE]
MY PRODUCTION FACTORS: [PASTE — INCLUDE UNIT AND SOURCE PROJECT]
CREW / SHIFTS / CALENDAR: [PASTE]
SHOP-FIELD SCOPE SPLIT: [PASTE]
CONSTRAINTS: [ACCESS, PHASING, HEIGHT, FINISH, INSPECTION, WEATHER, ETC.]

Produce:

1. ASSUMPTION LEDGER — activity, quantity, supplied factor, calculated hours,
   crew basis, source of factor, and confidence HIGH / MEDIUM / LOW.
2. UNIT CHECK — confirm that each calculation uses compatible units. Show the
   arithmetic and flag mixed units, missing quantities, or missing factors.
3. CONSTRAINT ADJUSTMENTS — list constraints that may make a historical factor
   non-comparable. Do not create an adjustment; ask what factor I want applied.
4. SCOPE COVERAGE — list work in the scope narrative with no labor line and
   labor lines with no traceable scope item.
5. SENSITIVITY TABLE — using only the alternate factors I give you, show the
   total-hour effect of each alternative.
6. ESTIMATE BASIS SUMMARY — a short narrative suitable for the estimate file,
   stating what is included, the rate sources, and unresolved assumptions.

RULES:
- Never supply a production rate, crew size, wage, burden, or efficiency factor.
- Label every number as SUPPLIED or CALCULATED.
- Do not convert hours to cost unless I provide the applicable loaded rates.
- Do not merge shop and field hours.
- If a factor's unit or source is missing, mark it unusable rather than guessing.
```

## Notes

The useful artifact is the assumption ledger, not a single total. When the plan
changes, the estimator can see which factor must move and why instead of trying
to reverse-engineer a lump sum.

## Variations

- **Estimate reconciliation.** Compare estimated hours with actual hours from a
  completed job, grouped by activity, without declaring causation.
- **Crew-plan check.** Given total hours and a supplied crew/calendar, calculate
  duration and identify where it conflicts with contract milestones.

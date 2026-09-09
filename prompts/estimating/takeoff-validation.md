# Takeoff Validation

**Use when** a takeoff is complete and you want a second set of eyes before it
feeds a bid.

**You must supply**
- The takeoff itself — member marks, shape designations, lengths, quantities, and the weight you assigned to each line
- Total tonnage as your takeoff currently reports it
- Drawing set number and revision the takeoff was performed against

**Verify before acting**
Claude can check internal consistency and arithmetic. It cannot confirm that a
member exists on the drawings or that you read the plan correctly. Discrepancies
it flags are *candidates for review*, not confirmed errors — check each against
the drawing before changing a number.

---

## Prompt

```text
You are reviewing a structural steel material takeoff for arithmetic and
internal consistency. I am the estimator; I own the final numbers.

TAKEOFF DATA:
[PASTE TABLE: mark, shape, length, qty, unit weight, line weight]

MY REPORTED TOTAL: [TONS] tons
DRAWING SET: [S-SERIES, REV #, DATED]

Check the following and report each finding separately:

1. WEIGHT ARITHMETIC. For each line, the nominal weight per foot is encoded in
   the shape designation (a W24x68 is 68 lb/ft nominal). Recompute
   length x qty x nominal weight and flag any line where my line weight differs
   by more than 2%. Show your computation for every line you flag.

2. TOTAL ROLLUP. Sum the line weights independently and compare to my reported
   total. Report the delta in both pounds and tons.

3. SHAPE DESIGNATION VALIDITY. Flag any designation that is malformed or that
   you do not recognize as a standard rolled shape (W, S, HP, C, MC, L, WT, HSS,
   Pipe). Do not guess at a substitute — just flag it.

4. INTERNAL CONSISTENCY. Flag marks appearing twice with different shapes or
   lengths, lengths implausible for the shape (e.g. a W44 at 4 ft, a W8 at 90 ft),
   and quantities of zero or blank.

5. OMISSION PROMPTS. List the categories a structural takeoff commonly carries
   that appear ABSENT here — base plates, stiffeners, connection material,
   anchor rods, shear studs, bracing, embeds, grating, handrail, stairs, bolts,
   weld metal, galvanizing or paint. Ask whether each is out of scope or missed.
   Do not add tonnage for them.

RULES:
- Do not estimate a weight for anything not in my data.
- Do not adjust my numbers. Report; I decide.
- State plainly when you cannot verify something from what I gave you.
- Nominal weights from shape designations are a check on ARITHMETIC only. Final
  weights must come from current AISC tables or the mill's certified data.

Output as a table of findings, most consequential first, then the omission
questions as a separate list.
```

## Notes

The 2% threshold in step 1 is the tolerance in the README's own example. Tighten
it to 0.5% for a hard-bid package where the tonnage drives the number; loosen it
for a conceptual budget.

Nominal weight from the designation is a genuine arithmetic check — it is
definitional, not looked up. It will **not** catch a shape that is real but wrong
for the condition. That is a drawing comparison, and it is yours to do.

## Variations

- **Two-takeoff reconciliation.** Paste both and ask for a line-by-line diff by
  mark, with a separate list of marks present in one and absent from the other.
- **Historical sanity check.** Add: "Compare lb/sq ft of framed area against
  these three past projects of similar type: [DATA]. Flag if outside the range
  and say which project it most resembles."

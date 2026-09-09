# Punch List Write-up

**Use when** walk notes need to become items a crew can actually close.

**You must supply**
- Walk notes with locations — grid, level, member mark
- Who identified each item and when
- The acceptance standard in play (spec section, AISC, contract)

**Verify before acting**
An item written without a clear acceptance criterion will be argued about at
closeout. Confirm each one names what "done" is before it goes on the list.

---

## Prompt

```text
You are converting punch walk notes into assignable punch list items for a
structural steel scope. I performed the walk.

WALK NOTES:
[PASTE — rough is fine]

WALK DATE: [DATE]     IDENTIFIED BY: [NAME / ROLE]
ACCEPTANCE BASIS: [SPEC SECTIONS, AISC REFERENCES, CONTRACT PROVISIONS]

For each item produce:

- ITEM NUMBER
- LOCATION — grid, level, member mark. Specific enough that someone who was not
  on the walk can stand in front of it.
- CONDITION OBSERVED — factual description, no cause, no blame.
- ACCEPTANCE CRITERION — what makes this closed. Reference the standard from the
  acceptance basis I gave you. If my notes do not establish one, write
  CRITERION TO BE CONFIRMED rather than inventing a tolerance.
- RESPONSIBLE PARTY — from my notes. If unclear, write TBD.
- PRIORITY — does it block following trades, inspection, or closeout?

Then produce:

1. GROUPED VIEW by area and by responsible party, so it can be issued as work
   lists rather than one long document.
2. PATTERN FLAGS — where several items share a root cause (one connection detail
   recurring, one crew, one sequence). Say so; fixing the pattern beats fixing
   twelve items.
3. NOT-MY-SCOPE — items that appear to belong to another trade, flagged for
   redirection rather than silently carried.
4. INSUFFICIENT DETAIL — notes too vague to write an item from, listed so I can
   re-walk them while it is fresh.

RULES:
- Never invent a tolerance, dimension, or acceptance standard. Weld, bolt, and
  erection tolerances come from the governing spec and AISC — if I did not give
  you the basis, mark it TBC.
- No fault, no cause, no commercial language. Condition and criterion only.
- Do not merge items at different locations even if the condition is identical;
  they get closed separately.
```

## Notes

Section 2 is where the leverage is. Twelve punch items on the same connection
type is not twelve problems — it is one detail that was misread, and it will
recur on the next area unless someone says so out loud.

The tolerance rule is not pedantry. Weld and erection tolerances are specific,
they vary by condition, and an invented one becomes an argument at closeout that
you lose.

## Variations

- **Closeout tracking.** Add status and dates, then ask for an aging report and
  what is blocking substantial completion.
- **Back-charge exposure.** For NOT-MY-SCOPE items, ask what documentation would
  need to exist to support redirecting the cost.

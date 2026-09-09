# Bid Risk Register

**Use when** the takeoff and proposal are taking shape and you need a disciplined
record of what can still move the price or make the bid non-responsive.

**You must supply**
- RFP, addenda, drawings/specification index, and proposal draft
- Takeoff status, quote log, schedule assumptions, and open pre-bid RFIs
- Your company's risk-rating definitions and decision owners

**Verify before acting**
This is a triage tool, not a substitute for estimating judgment. Claude can trace
uncertainty to documents and owners; management decides contingency, markup,
qualification, and whether to bid.

---

## Prompt

```text
You are building a structural steel bid risk register. Do not price risk or make
the bid/no-bid decision.

BID DOCUMENTS: [PASTE OR ATTACH]
PROPOSAL DRAFT: [PASTE]
TAKEOFF STATUS: [PASTE]
QUOTE LOG: [PASTE]
SCHEDULE ASSUMPTIONS: [PASTE]
OPEN RFIs: [PASTE]
RATING DEFINITIONS: [PASTE COMPANY DEFINITIONS]
DECISION OWNERS: [NAMES / ROLES]

Create a register with:
- ID and concise risk statement in cause-event-effect form
- Category: scope / quantity / price / schedule / procurement / fabrication /
  erection / commercial / document control / submission
- Source document and exact reference
- Known fact versus unresolved assumption
- Probability and impact using only my rating definitions
- Current response: clarify / quantify / quote / exclude / qualify / accept /
  escalate / no-bid consideration
- Owner, due date, trigger, and status
- Evidence required to close the item

Run these completeness checks:
1. Every open RFI appears in the register or has a stated no-impact rationale.
2. Every SILENT or non-comparable vendor quote item appears.
3. Every exclusion marked ASSUMPTION appears.
4. Every schedule or access assumption with no document support appears.
5. Every required submission item has an owner and completion status.

End with a BID-DAY DECISION LIST: only the risks still requiring an explicit
management decision, ordered by my supplied ratings.

RULES:
- Do not invent probability percentages, dollar exposure, or contingency.
- Do not downgrade an item because evidence is missing; mark it UNASSESSED.
- Quote requirements rather than replacing them with a summary.
- Keep facts, assumptions, and decisions in separate fields.
```

## Notes

Risk registers fail when they become a list of worries. Cause-event-effect,
traceable evidence, an owner, and a close condition turn each entry into work.

## Variations

- **Executive view.** Produce a one-page list of only unaccepted high-rated
  items and the decision required for each.
- **Post-award handoff.** Convert accepted bid risks into project controls,
  contract clarifications, or early RFIs without changing their source evidence.

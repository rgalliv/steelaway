# Erection Sequence Review

**Use when** a sequence is drafted and you want the questions asked before the
crane is on site.

**You must supply**
- The proposed sequence: areas or zones, order, crane positions, durations
- Framing description — bay sizes, heights, bracing type and location, deck and slab plan
- Site constraints: access, laydown, adjacent work, restrictions on hours or lifts

**Verify before acting**
**This template produces questions, not approvals.** Erection stability,
temporary bracing, and crane picks are engineering determinations. AISC and OSHA
both place erection stability with qualified people. Use this to build the
agenda for that review, never to replace it.

---

## Prompt

```text
You are reviewing a proposed structural steel erection sequence and raising
questions for the erection engineer and superintendent to resolve. You are NOT
approving the sequence and NOT performing stability analysis.

PROPOSED SEQUENCE:
[ZONE / AREA, ORDER, CRANE POSITION, DURATION]

FRAMING: [BAY SIZES, NUMBER OF LEVELS, HEIGHTS, FRAMING SYSTEM]
LATERAL SYSTEM: [BRACED FRAME / MOMENT FRAME / SHEAR WALL — AND WHERE]
DECK AND SLAB: [PLAN AND TIMING]
SITE CONSTRAINTS: [ACCESS, LAYDOWN, ADJACENT WORK, HOUR OR LIFT RESTRICTIONS]

Raise questions in these areas. Each must be answerable by a specific person.

1. STABILITY DURING ERECTION. Where does the sequence create a condition whose
   lateral stability depends on elements not yet installed? Ask where temporary
   bracing is required, who designs it, and when it is removed. Flag any zone
   erected before its permanent lateral system.

2. CRANE ACCESS AND REACH. Where does the sequence require a pick whose radius or
   weight looks questionable given the stated positions? Ask for the pick plan.
   Flag any zone the sequence appears to strand — erected steel blocking access to
   steel not yet erected.

3. CONNECTION COMPLETION. Where does the sequence advance while bolt-up, welding,
   or plumbing-and-bolting is incomplete behind it? Ask what the trailing
   completion requirement is and who verifies it.

4. DECK AND SLAB INTERACTION. Where does deck placement or concrete depend on a
   frame condition the sequence has not yet reached, or vice versa?

5. TRADE AND SITE INTERFACE. Where does the sequence conflict with the stated
   constraints or with adjacent work?

6. DELIVERY IMPLICATION. What does this sequence demand of delivery order?
   Where does it require a shipment split that fabrication may not have planned?

FORMAT: group by area, most consequential first. Each question names the
discipline that answers it (erection engineer / superintendent / fabricator /
EOR / GC).

RULES:
- Do not state that a sequence is safe, stable, or acceptable.
- Do not design temporary bracing, size a crane, or specify a pick.
- Do not calculate loads or capacities.
- Where a question touches OSHA Subpart R or the AISC Code of Standard Practice,
  name the topic so the qualified reviewer can check the current text. Do not
  paraphrase requirements as though quoting them.
```

## Notes

The rules block is doing real work. Erection stability is where steel kills
people, and the failure mode of a language model here is fluent, confident, and
wrong. Questions are safe output; conclusions are not.

Used correctly this shortens the review meeting rather than replacing it —
the superintendent walks in with the list already assembled.

## Variations

- **Delivery-driven.** Invert it: give the delivery schedule and ask what
  sequence it implies and where that conflicts with the framing.
- **Re-sequence impact.** Give the original and revised sequences and ask what
  new questions the change introduces.

# Delivery and Laydown Coordination

**Use when** a steel delivery is approaching and the shop, carrier, and site need
one shared readiness check.

**You must supply**
- Delivery manifest with marks, quantities, weights, dimensions, and load order
- Site logistics plan, access window, laydown zones, and receiving constraints
- Erection sequence, current field status, and responsible contacts
- The approved unloading or lift plan reference, when the site requires one

**Verify before acting**
This template coordinates information; it does not approve transport, rigging,
crane setup, unloading, or site conditions. The carrier and qualified site team
confirm legal transport and the competent/qualified people approve the work plan.

---

## Prompt

```text
You are reviewing a planned structural steel delivery for coordination gaps.
You are not approving transport, unloading, rigging, or lifting.

MANIFEST: [PASTE]
SITE LOGISTICS PLAN: [PASTE]
ACCESS WINDOW / RESTRICTIONS: [PASTE]
LAYDOWN PLAN: [PASTE]
ERECTION SEQUENCE / CURRENT STATUS: [PASTE]
APPROVED UNLOADING OR LIFT PLAN REFERENCE: [PASTE OR "NOT SUPPLIED"]
CONTACTS: [FABRICATOR, CARRIER, ERECTOR, GC, SITE RECEIVER]

Produce a readiness board:

1. LOAD IDENTITY — load number, marks, quantity, stated weight/dimensions,
   revision basis, and requested arrival window.
2. SEQUENCE FIT — whether the manifest order supports the supplied erection
   sequence. Identify buried or missing priority marks without proposing a pick.
3. ACCESS AND STAGING — unanswered questions about gate, route, turn/clearance,
   ground/laydown availability, adjacent work, and delivery-hour restrictions.
4. RECEIVING — named receiver, manifest reconciliation, damage documentation,
   material identification, and discrepancy escalation process.
5. UNLOADING READINESS — required approved plan/reference, crew/equipment
   confirmation, exclusion-zone coordination, and stop-work authority. Phrase
   safety items as confirmations for the responsible qualified person.
6. DISPOSITION — READY TO CONFIRM / HOLD FOR INFORMATION / RESEQUENCE REQUESTED.
   Give the missing information behind any hold.

Then draft a short coordination email listing only confirmed facts, requested
confirmations, owners, and response deadline.

RULES:
- Do not calculate rigging, select equipment, determine crane capacity, or
  describe an unloading method.
- Do not state that access, ground, laydown, or a lift is safe or adequate.
- Use only supplied weights, dimensions, dates, and revision identifiers.
- Do not mark READY while a required approval or responsible contact is missing.
```

## Notes

The manifest is a coordination baseline, not proof of what arrived. The receiving
record should preserve shortages, damage, unidentified material, and revision
questions while the truck and witnesses are still present.

## Variations

- **Daily delivery huddle.** Summarize today's loads, holds, site conflicts, and
  confirmations due before dispatch.
- **Sequence mismatch.** Compare load order with the next five erection steps and
  draft a resequencing request to the fabricator without directing fabrication.

# Lift Plan Readiness Review

**Use when** an approved lift-plan package is expected and the project team wants
to find missing inputs, interfaces, or confirmations before the pre-lift meeting.

**You must supply**
- The current lift-plan package and its approval/revision status
- Load identification and verified weight source
- Crane configuration documents and site/logistics information supplied by the
  lift planner
- Roles, qualifications, communication plan, and change-control process

**Verify before acting**
**This template does not create, approve, or validate a lift plan.** Crane setup,
capacity, rigging, ground support, clearances, weather limits, and lift execution
belong to the qualified people identified by the employer and governing plan.
Use the output only as an agenda and document-completeness check.

---

## Prompt

```text
You are reviewing a lift-plan package for document completeness and coordination.
You are not engineering the lift and must not state that it is safe or adequate.

LIFT PLAN / REVISION / APPROVAL STATUS: [ATTACH OR PASTE]
LOAD ID / VERIFIED WEIGHT SOURCE: [PASTE]
CRANE CONFIGURATION DOCUMENTS: [PASTE OR ATTACH]
SITE / ACCESS / SETUP INFORMATION: [PASTE]
RIGGING DOCUMENTS: [PASTE OR ATTACH]
ROLES / QUALIFICATIONS: [PASTE]
COMMUNICATION / SIGNAL PLAN: [PASTE]
WEATHER / OPERATING LIMIT SOURCE: [PASTE]
CHANGE-CONTROL PROCESS: [PASTE]

Create a readiness checklist with PRESENT / MISSING / CONFLICT / REQUIRES
QUALIFIED REVIEW for:

1. Document identity, revision, approval, and distribution.
2. Load identity, weight source, dimensions, center-of-gravity information if
   supplied, and pick-point references.
3. Crane identity and configuration consistency across supplied documents.
4. Site interfaces: access, setup area, ground-support documentation, utilities,
   obstructions, adjacent work, exclusion-zone coordination, and load path.
5. Rigging identification and inspection/status documentation supplied for the job.
6. Named lift director/planner, operator, riggers, signal person, site authority,
   and stop-work/change authority.
7. Communication method, pre-lift briefing, contingency or abort criteria, and
   what conditions require the plan to return for review.

For every MISSING or CONFLICT item, ask one specific question, identify the
responsible role, and cite the document that created the expectation.

RULES:
- Do not calculate capacity, radius, load, sling force, ground bearing, or wind.
- Do not select crane configuration, rigging, matting, pick points, or load path.
- Do not infer compliance from a checked box or an approval signature.
- Do not replace the controlling manufacturer instructions, approved lift plan,
  current regulations, or employer procedures.
- If a technical value conflicts, show both sources and route it for qualified review.
```

## Notes

Readiness is about whether the right information reached the right people at the
same revision. A complete-looking package can still fail that test when the load
weight changed, the site plan moved, or the field copy is superseded.

## Variations

- **Pre-lift meeting agenda.** Convert only unresolved items into an agenda with
  owner, evidence required, and close-out record.
- **Change review.** Compare approved and proposed conditions and identify what
  must return to the lift planner; do not decide whether the change is acceptable.

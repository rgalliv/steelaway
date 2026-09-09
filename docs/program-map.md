# Program Map

Steel Away now covers the structural steel project lifecycle with seven programs.
Each program is a workflow: a controlled sequence of templates that carries
evidence forward without turning Claude into the decider.

## Choose by project phase

| Phase | Program | Primary result |
|---|---|---|
| Bid | [`Bid Package Preparation`](../workflows/bid-package-preparation.md) | Reconciled, submission-ready proposal package |
| Award | [`Award to Fabrication Release`](../workflows/award-to-fabrication-release.md) | Traceable release gates by lot or area |
| Active project | [`Monthly Project Review`](../workflows/monthly-project-review.md) | Commercial and schedule risk summary |
| Design change | [`Drawing Revision to Change Management`](../workflows/drawing-revision-to-change-management.md) | Controlled technical, notice, and pricing record |
| Fabrication and erection | [`Weekly Fabrication and Field Coordination`](../workflows/weekly-fabrication-and-field-coordination.md) | One shop-to-field control board |
| Field question/change | [`RFI to Change Order`](../workflows/rfi-to-change-order.md) | Answered technical issue with preserved commercial record |
| Closeout | [`Project Closeout`](../workflows/project-closeout.md) | Accepted turnover index and final-payment checklist |

## How the programs connect

```text
BID PACKAGE
    │ awarded baseline
    ▼
AWARD → FABRICATION RELEASE
    │ released lots and milestones
    ▼
WEEKLY FABRICATION + FIELD COORDINATION ──────► PROJECT CLOSEOUT
    │                         ▲
    ├─ scheduled health check ┤
    │   MONTHLY REVIEW        │
    │                         │
    └─ issue or revision ─► RFI / REVISION → CHANGE MANAGEMENT
```

The arrows carry source records, not conclusions. A bid assumption does not
become an awarded fact. A proposed delivery date does not become a commitment.
An RFI answer does not become a change order. Each program includes a human gate
where the authorized person makes that transition.

## Shared operating rules

1. **Start from controlled documents.** Record file identity, revision, and
   date before asking for analysis.
2. **Label state.** Keep FACT, ASSUMPTION, PROPOSAL, COMMITMENT, APPROVAL, and
   UNKNOWN distinct.
3. **Keep lanes separate.** Technical approval, safety determination, contract
   interpretation, pricing, billing certification, and release authority remain
   with the responsible qualified or authorized person.
4. **Close with evidence.** Every action needs an owner, date, and observable
   close condition—not just a meeting note that says it was discussed.
5. **Preserve the baseline.** Revisions, changes, forecasts, and corrections are
   meaningful only when the prior basis remains traceable.

## Lightweight adoption

Do not deploy all seven programs at once. Begin with the point where information
is currently being lost:

- Missed bid scope: start with Bid Package Preparation.
- Shop releases on incomplete information: start with Award to Fabrication Release.
- Fabrication and field blaming each other's dates: start with Weekly Coordination.
- Work proceeding before notice or pricing: start with Revision to Change Management.
- Retention stuck at the end: start Project Closeout before demobilization.

After two cycles, keep the fields people actually use, remove duplicate entry,
and connect the output to the company's system of record.

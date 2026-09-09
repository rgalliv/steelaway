# Workflows

A prompt handles one task. A workflow chains several, carrying output forward.
Each is written as numbered steps you run in one conversation, so context
accumulates.

| Workflow | Spans | Prompts used |
|---|---|---|
| [`bid-package-preparation.md`](bid-package-preparation.md) | RFP received → proposal out | takeoff-validation, bid-exclusion-list, bid-comparison-matrix |
| [`rfi-to-change-order.md`](rfi-to-change-order.md) | Field question → COR submitted | rfi-drafting, scope-gap-analysis, change-order-narrative |
| [`monthly-project-review.md`](monthly-project-review.md) | Recurring health check | submittal-log-triage, scope-gap-analysis |
| [`award-to-fabrication-release.md`](award-to-fabrication-release.md) | Executed award → controlled shop release | scope-gap-analysis, subcontract-risk-review, bid-risk-register, submittal-log-triage, delivery-and-milestone-plan |
| [`drawing-revision-to-change-management.md`](drawing-revision-to-change-management.md) | Revised document → disposition and change record | drawing-revision-impact, notice-deadline-tracker, rfi-drafting, change-order-narrative |
| [`weekly-fabrication-and-field-coordination.md`](weekly-fabrication-and-field-coordination.md) | Shop/field status → weekly control board | fabrication-status-recovery, delivery-and-milestone-plan, delivery-and-laydown-coordination, field-issue-report |
| [`project-closeout.md`](project-closeout.md) | Approaching completion → accepted archive and final billing | closeout-obligation-tracker, punch-list-writeup, notice-deadline-tracker, pay-application-backup-review |

**Run each workflow in a single conversation.** The steps depend on earlier
context. Starting fresh at step 4 means re-pasting everything, and the value is
in the accumulation.

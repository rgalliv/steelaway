# Workflows

A prompt handles one task. A workflow chains several, carrying output forward.
Each is written as numbered steps you run in one conversation, so context
accumulates.

| Workflow | Spans | Prompts used |
|---|---|---|
| [`bid-package-preparation.md`](bid-package-preparation.md) | RFP received → proposal out | takeoff-validation, bid-exclusion-list, bid-comparison-matrix |
| [`rfi-to-change-order.md`](rfi-to-change-order.md) | Field question → COR submitted | rfi-drafting, scope-gap-analysis, change-order-narrative |
| [`monthly-project-review.md`](monthly-project-review.md) | Recurring health check | submittal-log-triage, scope-gap-analysis |

**Run each workflow in a single conversation.** The steps depend on earlier
context. Starting fresh at step 4 means re-pasting everything, and the value is
in the accumulation.

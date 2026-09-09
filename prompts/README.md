# Prompt Library

Twelve templates, three per category. Each file has the same shape:

| Section | What it holds |
|---|---|
| **Use when** | The situation this template is for |
| **You must supply** | Inputs the prompt cannot work without |
| **Verify before acting** | What to check against source documents |
| **Prompt** | The copy-paste block, with `[BRACKETED]` slots |
| **Notes / Variations** | How to adapt it |

## Index

### Estimating
- [`takeoff-validation.md`](estimating/takeoff-validation.md) — cross-check a takeoff for arithmetic and consistency errors
- [`bid-exclusion-list.md`](estimating/bid-exclusion-list.md) — draft a scope exclusion list from an RFP
- [`bid-comparison-matrix.md`](estimating/bid-comparison-matrix.md) — normalize sub-bids onto one comparable basis

### Project management
- [`rfi-drafting.md`](project-mgmt/rfi-drafting.md) — turn a field question into a clean, answerable RFI
- [`submittal-log-triage.md`](project-mgmt/submittal-log-triage.md) — find what is actually blocking fabrication
- [`erection-sequence-review.md`](project-mgmt/erection-sequence-review.md) — sanity-check a sequence for stability and access

### Field operations
- [`daily-report.md`](field-ops/daily-report.md) — structure field notes into a defensible daily report
- [`jha-review.md`](field-ops/jha-review.md) — review a draft JHA for gaps before a competent person signs it
- [`punch-list-writeup.md`](field-ops/punch-list-writeup.md) — turn walk notes into assignable punch items

### Contracts
- [`subcontract-risk-review.md`](contracts/subcontract-risk-review.md) — surface the clauses that move risk onto you
- [`change-order-narrative.md`](contracts/change-order-narrative.md) — write the entitlement narrative for a COR
- [`scope-gap-analysis.md`](contracts/scope-gap-analysis.md) — compare contract scope to drawings and find the holes

## The rule that applies to all of them

**Claude does not produce engineering judgment, legal advice, or a safety
determination.** Everything here drafts, organizes, checks arithmetic, and asks
questions a careful reviewer would ask. A licensed engineer, an attorney, and a
competent person remain the deciders in their respective lanes. Every template
ends with a verification step for that reason — it is not boilerplate.

# Getting Started

## If you have never used this kind of tool for work

Start with one task you already know how to do well. Run
[`daily-report.md`](../prompts/field-ops/daily-report.md) on a day you remember
clearly, and compare the output to what you would have written. You will learn
more about where the tool helps and where it does not from that one comparison
than from any amount of explanation.

Then move to something with more leverage —
[`submittal-log-triage.md`](../prompts/project-mgmt/submittal-log-triage.md) if
you have an active project, or
[`takeoff-validation.md`](../prompts/estimating/takeoff-validation.md) if you are
bidding.

## Using a template

1. Open the file. Read **Use when** and **Verify before acting** first.
2. Gather everything under **You must supply.** Templates fail mainly from thin
   inputs, not from bad prompts.
3. Copy the block inside the ```text fence.
4. Replace every `[BRACKETED]` slot. Leaving one unreplaced produces confident
   output about a project that does not exist.
5. Paste into Claude with your documents.
6. Do the verification step. It is not optional and it is not boilerplate.

## What actually determines output quality

**Specificity.** "Review my takeoff" gets you a generic checklist. The template's
version — with marks, shapes, lengths, quantities, a stated total, and a drawing
revision — gets you arithmetic on your actual numbers.

**Complete documents.** Paste the whole contract, not the summary. The clause
that matters is the one nobody summarized.

**Saying what you already checked.** It stops the tool from telling you what you
know and focuses it on what you do not.

## Where it will disappoint you

- **It has not seen the drawings.** Every drawing-dependent conclusion is yours.
- **It will produce a plausible number if you let it.** The templates forbid
  this; if you write your own, forbid it too.
- **It does not know your project's history** unless you tell it, in this
  conversation.
- **It is not the decider** on anything in
  [`references/verification.md`](../references/verification.md).

## Suggested first week

| Day | Do this |
|---|---|
| 1 | Daily report on a day you remember. Compare. |
| 2 | Submittal triage on a live log. Act on one finding. |
| 3 | Scope gap analysis on an active contract. |
| 4 | Draft one real RFI. Send it. |
| 5 | Read [`verification.md`](../references/verification.md) again, now that you have seen what the output looks like. |

Then read [`writing-prompts.md`](writing-prompts.md) and start adapting.

# Workflow: RFI to Change Order

**Spans** a field condition that looks like a change → COR submitted.
**You still own** Whether to pursue it, the pricing, and the commercial
relationship.

---

## Step 1 — Establish the baseline first

Before writing anything, pin down what the contract documents required. Run
[`scope-gap-analysis.md`](../prompts/contracts/scope-gap-analysis.md) narrowed to
the affected area.

If the baseline is not documented, stop. There is no entitlement without one, and
everything downstream is wasted effort.

## Step 2 — Ask the question

Run [`rfi-drafting.md`](../prompts/project-mgmt/rfi-drafting.md).

Keep the RFI technical. Do not mention cost or delay in it. An RFI that argues
commercially invites a response written defensively, and you want a clean
technical answer on the record.

## Step 3 — Read the response as a change

```text
Here is my RFI and the response received.

RFI: [PASTE]        RESPONSE: [PASTE, WITH DATE RECEIVED]
CONTRACT BASELINE: [FROM STEP 1, WITH CITATIONS]

Assess:
1. Does the response answer the question, or does it need a follow-up?
2. Does it direct work differing from the baseline? Be specific about the delta.
3. If yes: what work, materials, or sequence does it add, remove, or change?
4. What is the notice trigger date and what does my contract's notice provision
   require from it?
5. Does the response direct work while remaining silent on cost — meaning I must
   give notice now to preserve the claim?

Do not price anything. Identify the delta and the notice obligation.
```

Question 5 is the one that saves money. Notice periods run from direction, not
from when you get around to pricing.

## Step 4 — Give notice immediately

Send it. Now, not after pricing. Preserve the claim first.

## Step 5 — Price it

Yours. Labor, material, equipment, subs, markup per the contract's change
provision.

## Step 6 — Write the narrative

Run [`change-order-narrative.md`](../prompts/contracts/change-order-narrative.md)
with the baseline from step 1, the direction from step 3, and your actual notice
dates from step 4.

## Step 7 — Adversarial read

```text
Read this change order request as the GC's project manager looking for reasons to
reject it. List every weakness: unsupported assertions, missing citations, notice
problems, causation gaps between the change and the cost, anything overstated.

Be harsh. I would rather hear it now.

[PASTE COR]
```

Fix what it finds before submitting.

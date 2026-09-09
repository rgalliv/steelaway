# Workflow: Bid Package Preparation

**Spans** RFP in hand → proposal ready to send.
**Time** Roughly half a day of review, depending on package size.
**You still own** Pricing, markup, risk appetite, and the number.

---

## Step 1 — Read the RFP for what it demands of you

```text
I am bidding a structural steel package. Read this RFP and extract, as separate
lists: (a) hard submission requirements — format, deadline, required forms,
bond, insurance limits, addenda acknowledgment; (b) scope statements that define
what is in and out; (c) anything ambiguous enough to warrant a pre-bid RFI;
(d) commercial terms that affect price — schedule, LDs, retention, escalation.

Quote the RFP for each. Do not summarize into your own words the things I could
be held to.

[PASTE RFP]
```

Non-responsiveness kills more bids than price does. Do this first.

## Step 2 — Pre-bid RFIs

Take list (c) and run [`rfi-drafting.md`](../prompts/project-mgmt/rfi-drafting.md)
against the items worth asking. Send them. Note the response deadline — questions
asked after it are usually not answered, and you will price the ambiguity.

## Step 3 — Validate the takeoff

Run [`takeoff-validation.md`](../prompts/estimating/takeoff-validation.md).
Resolve every flagged line against the drawings before the number moves forward.

## Step 4 — Normalize vendor quotes

Run [`bid-comparison-matrix.md`](../prompts/estimating/bid-comparison-matrix.md).
Work the call list it produces — every SILENT cell is an item nobody has agreed
to own.

## Step 5 — Draft exclusions

Run [`bid-exclusion-list.md`](../prompts/estimating/bid-exclusion-list.md), using
the RFP scope statements from step 1 and what you actually carried from steps 3–4.

## Step 6 — Consistency pass

```text
Here is my complete proposal: scope of work, inclusions, exclusions,
clarifications, and the RFP requirements from step 1.

Check for:
1. Anything I include in one section and exclude in another.
2. Exclusions that contradict an explicit RFP requirement — these risk making
   the bid non-responsive. Flag loudly.
3. Submission requirements from step 1 that my package does not satisfy.
4. Vague language that will be read against me in a scope fight.
5. Anything the vendor quotes assume that my proposal does not state.

Quote the conflicting passages side by side. Do not rewrite; show me the conflict.

[PASTE PROPOSAL]
```

## Step 7 — Human review

Price, markup, and the go/no-go are yours. Nothing above touched them, and
nothing above should.

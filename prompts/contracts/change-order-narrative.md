# Change Order Narrative

**Use when** the cost is built and you need the entitlement story that gets it
approved.

**You must supply**
- What changed, and the document that changed it (RFI response, ASI, bulletin, field direction)
- The original contract requirement it departs from, with a citation
- Notice you gave — when, to whom, how
- Cost and schedule impact, already priced

**Verify before acting**
Confirm the notice dates against your own records before the narrative asserts
them. Most change orders are not denied on pricing — they are denied on late or
undocumented notice, and a narrative that overstates notice is worse than one
that admits it was late.

---

## Prompt

```text
You are drafting the entitlement narrative for a change order request on a
structural steel subcontract. Pricing is done; this is the justification.

WHAT CHANGED: [DESCRIBE]
CHANGE DOCUMENT: [RFI RESPONSE #, ASI #, BULLETIN #, FIELD DIRECTION — WITH DATE]
ORIGINAL REQUIREMENT: [WHAT THE CONTRACT DOCUMENTS REQUIRED, WITH DRAWING/SPEC CITATION]
NOTICE GIVEN: [DATE, TO WHOM, METHOD]
CONTRACT NOTICE REQUIREMENT: [DAYS, AND FROM WHAT TRIGGER]
COST IMPACT: [AMOUNT, WITH BREAKDOWN]
SCHEDULE IMPACT: [DAYS, AND WHICH ACTIVITIES]

Write a narrative with:

1. THE CHANGE — what is different now, in one paragraph, factual.

2. BASELINE — what the contract documents required before the change, with
   specific citation to drawing number and revision, or spec section. This is
   the load-bearing part: entitlement is the delta from a documented baseline,
   and a narrative without a citation here is an opinion.

3. DIRECTION — who directed the change and under what document. Quote the
   directing language if I gave it to you.

4. NOTICE — when notice was given, to whom, by what method, against the contract
   requirement. State the comparison plainly. If notice was late or informal,
   SAY SO and note it as a point to address — do not paper over it.

5. IMPACT — cost and schedule as I priced them, tied to the change. Explain the
   causal chain from change to cost, not just the total.

6. REQUEST — the specific relief: dollar amount, time extension, or both.

RULES:
- Every factual assertion cites a document. No unsupported claims.
- Do not characterize intent or assign blame. Documents and dates only.
- Do not overstate. If notice was weak, the narrative must reflect it — an
  overstated claim that unravels costs more than a candid one.
- Do not invent a contract provision. If I did not give you the notice
  requirement, ask for it rather than assuming a standard.
- Professional and factual. This may be read by people who are not friendly to it.
```

## Notes

Section 2 is where change orders are won or lost. "They changed it" is not
entitlement. "Drawing S-301 Rev 2 dated [date] showed X; RFI 47 response dated
[date] directs Y; the delta is Z" is entitlement.

The instruction to admit weak notice is deliberate and it is commercially
correct. A reviewer who finds one overstatement discounts the entire package.

## Variations

- **Rejected COR.** Paste the rejection and ask for a point-by-point response
  identifying which objections are factual disputes, which are documentation
  gaps you can close, and which are genuine entitlement problems.
- **Cumulative impact.** Multiple related changes: ask for a narrative covering
  the cumulative effect on sequence and productivity, flagging clearly that
  cumulative impact claims generally need scheduling analysis to support.

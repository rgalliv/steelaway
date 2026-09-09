# Subcontract Risk Review

**Use when** a subcontract arrives and you want the risk-shifting clauses found
before signature.

**You must supply**
- The full agreement, including exhibits and anything incorporated by reference
- Your bid proposal, so you can see what did and did not carry through
- Your schedule and payment assumptions

**Verify before acting**
**This is not legal advice and Claude is not your lawyer.** It surfaces clauses
for review. Enforceability varies by state — some jurisdictions void pay-if-paid
or broad-form indemnity, others enforce them — and that determination is an
attorney's. Anything flagged here goes to counsel.

---

## Prompt

```text
You are reviewing a subcontract for a structural steel scope and identifying
clauses that shift risk onto the subcontractor. You are not providing legal
advice; I will take findings to counsel.

SUBCONTRACT:
[PASTE FULL TEXT INCLUDING EXHIBITS]

MY BID PROPOSAL:
[PASTE]

MY ASSUMPTIONS: [SCHEDULE, PAYMENT, ESCALATION]

Identify and quote the actual clause language for each of these, and say plainly
what it means in practice:

1. PAYMENT — pay-if-paid vs pay-when-paid, retention amount and release
   conditions, lien waiver requirements and whether they are conditional,
   set-off and back-charge rights, timing of payment applications.

2. SCHEDULE — is the schedule incorporated as a contract document, liquidated
   damages, acceleration obligations, float ownership, notice periods for delay,
   and whether the notice period is short enough to be a trap.

3. CHANGES — who can direct a change, the notice requirement and its deadline,
   whether work must proceed pending pricing, how markup is capped, and whether
   the change process waives claims if not followed exactly.

4. INDEMNITY AND INSURANCE — scope of indemnity (broad form / intermediate /
   limited), additional insured requirements, waiver of subrogation, limits
   demanded vs typical, and whether insurance obligations exceed indemnity.

5. SCOPE INCORPORATION — what documents are incorporated, the order of
   precedence, and any flow-down of prime contract terms. Flag flow-down that
   binds me to terms I have not seen.

6. TERMINATION AND SUSPENSION — for cause and convenience, what I recover,
   cure periods.

7. DISPUTES — forum, venue, governing law, mandatory arbitration or mediation,
   fee-shifting, waiver of consequential damages, and any claim-notice
   condition precedent.

THEN: BID-TO-CONTRACT DELTA. Every place my proposal's exclusions,
clarifications, or assumptions did NOT carry into the agreement. This is usually
the single largest source of unpriced risk and it is easy to miss.

FOR EACH FINDING: quote the clause, explain the practical effect in one or two
sentences, and rate exposure HIGH / MEDIUM / LOW with a reason.

RULES:
- Quote clause language. Do not paraphrase and present it as the contract.
- Do not opine on enforceability — that is jurisdiction-specific and it is
  counsel's call. Flag the clause and say enforceability requires review.
- Do not draft replacement language unless I ask.
- Note where a clause is ordinary market practice versus unusually aggressive,
  and say which.
```

## Notes

The bid-to-contract delta at the end is the highest-value section and the one
most often skipped. Exclusions win the argument at bid time and then quietly fail
to appear in the executed agreement, at which point they never existed.

The HIGH/MEDIUM/LOW rating is for triage — deciding what counsel's time goes to
first — not a substitute for the review.

## Variations

- **Compare to last time.** Paste a prior executed subcontract with the same GC
  and ask what changed.
- **Negotiation prep.** Ask for the five clauses with the best
  exposure-to-negotiability ratio, and a factual rationale for each ask.

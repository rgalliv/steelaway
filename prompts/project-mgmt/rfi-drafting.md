# RFI Drafting

**Use when** a question needs to go to the design team and you want it answered
on the first pass.

**You must supply**
- The specific condition, with grid line, elevation, and member marks
- Drawing numbers and revisions — the exact sheets that show the conflict
- What you have already checked, so the RFI does not ask what the documents answer
- Schedule impact if the answer is late

**Verify before acting**
Read the drawings again before sending. An RFI that a careful read would have
answered costs credibility, and the design team's response time on your next one
reflects it.

---

## Prompt

```text
You are drafting a Request for Information from a steel fabricator/erector to
the structural engineer of record. I will review and send it.

THE CONDITION:
[DESCRIBE — grid, level, member marks, what conflicts with what]

DRAWINGS: [SHEET NUMBERS AND REVISIONS]
WHAT I HAVE ALREADY CHECKED: [SHEETS, SPEC SECTIONS, PRIOR RFIs, SHOP DRAWINGS]
SCHEDULE IMPACT: [WHAT IS HELD, AND FROM WHAT DATE]
MY PROPOSED RESOLUTION, IF ANY: [OPTIONAL]

Draft an RFI with:

1. SUBJECT — one line, specific enough to be findable in a log six months later.
   Include grid and level.

2. QUESTION — the actual question, in one or two sentences, phrased so that a
   direct answer resolves it. Not a description of confusion. A question.

3. BACKGROUND — the condition, with drawing and revision references for every
   factual claim. State what I checked, so it is on the record that this is not
   answerable from the issued documents.

4. PROPOSED RESOLUTION — if I gave you one, state it as a proposal for the
   engineer's review and approval, never as a decision. If I gave you none, omit
   this section rather than inventing one.

5. IMPACT — what is held, from when, and the date by which an answer avoids
   impact. Factual, not argumentative.

RULES:
- Do not propose a structural modification, connection design, or member change
  as a conclusion. Any technical suggestion is submitted FOR THE ENGINEER'S
  REVIEW AND APPROVAL, and must say so.
- Do not assign fault or reference commercial consequences. Keep it technical.
- Every factual claim ties to a drawing, spec section, or prior document.
- Professional and neutral. This becomes a project record.
- If what I gave you is not enough to write a clear question, tell me what is
  missing instead of writing a vague RFI.
```

## Notes

The last rule earns its place. A vague RFI generates a vague answer and a second
RFI. If Claude tells you the question is not yet formed, that is the template
working.

"For the engineer's review and approval" is not throat-clearing. A fabricator
who states a structural conclusion in an RFI has, on some projects, assumed a
design responsibility they are not licensed or insured for.

## Variations

- **Batch.** Paste a list of conditions and ask for separate RFIs, plus a note
  on which could reasonably combine into one.
- **Response review.** Paste the returned answer and ask: does this actually
  answer the question, does it change scope, cost, or schedule, and what is the
  follow-up if it is incomplete?

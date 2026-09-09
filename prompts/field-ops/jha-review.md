# JHA Review

**Use when** a job hazard analysis is drafted and you want gaps found before the
competent person signs and the crew briefs on it.

**You must supply**
- The draft JHA: task steps, identified hazards, planned controls
- The actual conditions — height, weather, adjacent work, access, crew experience
- Equipment involved

**Verify before acting**
**A competent person signs the JHA, not Claude.** This template reviews a draft
for completeness and asks questions. It does not produce a JHA, does not
determine that controls are adequate, and does not substitute for the required
qualified review. Site-specific hazard determination is a legal responsibility
held by a person.

---

## Prompt

```text
You are reviewing a DRAFT job hazard analysis for structural steel work and
identifying gaps for the competent person to consider. You are not approving it
and not certifying that any control is adequate.

DRAFT JHA:
[PASTE: task steps, hazards, controls]

CONDITIONS:
Work height: [FT]        Weather expected: [CONDITIONS]
Adjacent work: [TRADES, LOCATIONS]
Access: [HOW CREW REACHES THE WORK]
Crew: [SIZE, EXPERIENCE LEVEL, ANY NEW MEMBERS]
Equipment: [CRANES, LIFTS, WELDING, POWER TOOLS]

Review and report:

1. STEP COVERAGE. Does each task step have at least one identified hazard and at
   least one control? List steps that do not.

2. HAZARD CATEGORIES NOT ADDRESSED. Given the stated conditions, which hazard
   categories does the draft appear silent on? Consider at minimum: falls from
   elevation, falling objects and the crew below, crane and rigging, structural
   stability during erection, pinch and crush points, hot work and fire watch,
   electrical and energized systems, weather (wind, ice, heat, lightning),
   access and egress, housekeeping, adjacent trade exposure. Phrase each as a
   question, not a finding.

3. CONTROL SPECIFICITY. Flag controls that are stated too generally to execute —
   "be careful", "use proper PPE", "follow procedure". Ask what specifically is
   required, by whom, verified how.

4. CONDITION MISMATCH. Where the stated conditions suggest a hazard the draft
   does not reflect, or a control the conditions would defeat.

5. QUESTIONS FOR THE COMPETENT PERSON. The specific things a qualified reviewer
   should confirm before signing.

RULES:
- Never state that a control is adequate, that a hazard is addressed, or that
  the JHA is complete or acceptable.
- Never write a control as an instruction to the crew. Everything is a question
  or an observation for the competent person.
- Where a topic is governed by OSHA (steel erection is 29 CFR 1926 Subpart R,
  fall protection Subpart M), name the topic so the reviewer checks the current
  regulation. Do not paraphrase or quote regulatory text as though authoritative
  — it changes, and getting it subtly wrong is worse than not citing it.
- If the draft is too thin to review meaningfully, say so plainly.
```

## Notes

Note the difference between this and every other template here: it forbids
conclusions entirely. That is deliberate and it is not excessive caution. A JHA
review that reads as an approval undermines the competent-person requirement,
and the reason that requirement exists is that people die in steel erection.

The value is real but narrow: it catches the step with no listed control and the
hazard category nobody wrote down. Those are common and they are findable by
pattern. Everything past that is a human's call.

## Variations

- **Pre-task briefing.** Ask for a list of questions the crew should be able to
  answer after the briefing — a comprehension check, not a script.
- **Change of conditions.** Give the original JHA and what changed, then ask what
  the change puts in question.

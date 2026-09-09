# Writing Your Own

The twenty-four templates share a structure. It is worth understanding, because your
own tasks will not match them exactly.

## The five parts

**1. Role and ownership.** Open by saying what Claude is doing and who decides.

> *You are reviewing a takeoff for arithmetic errors. I am the estimator; I own
> the final numbers.*

This does more than set tone. It establishes that the output is a draft for your
review, which is what keeps the tool in its lane.

**2. Labeled inputs.** Every input under a heading in caps. Ambiguity about which
document is which produces confident conclusions about the wrong one.

**3. Numbered tasks.** Discrete, checkable steps rather than one broad request.
"Review this contract" gets a summary. Seven numbered categories get seven
answers you can act on.

**4. Explicit rules.** The most important part and the one people leave out. Say
what must not happen:

> - Do not invent a weight for anything not in my data.
> - Do not adjust my numbers. Report; I decide.
> - State plainly when you cannot verify something from what I gave you.

**5. Output format.** Say how you want it. "A table of findings, most
consequential first" beats letting it choose.

## Rules worth reusing

Copy these into anything you write:

```text
- Do not invent values, tolerances, or standards. If I did not supply it, say so.
- Quote source documents; do not paraphrase and present it as the document.
- Distinguish what the documents REQUIRE from what they SHOW.
- Where you cannot verify something from what I gave you, say so plainly rather
  than producing a plausible answer.
- Do not make the decision. Give me what I need to make it.
```

That last one is the whole philosophy. Everything here organizes, checks, drafts,
and questions. Deciding stays with the person who carries the consequence.

## Calibrating uncertainty by stakes

Most tasks want fewer false positives. Some want fewer false negatives. Say
which:

> *Flag anything where being wrong is expensive, even at low confidence, and say
> your confidence is low.*

That is right for scope gaps, where a missed item costs real money and a false
flag costs ten minutes. It is wrong for a punch list, where noise makes the list
unusable.

## Testing a new prompt

Run it on something you already know the answer to. If it finds what you know is
there, and does not invent what is not, it is working. If it produces something
authoritative-sounding that you cannot trace to your inputs, add a rule and run
it again.

## Contributing back

Working prompts belong in the library. See the contribution process in the
[README](../README.md). Include what it is for, what it needs, and what to
verify — the same five parts.

# Bid Exclusion List

**Use when** preparing a proposal and you need exclusions that survive a scope
fight later.

**You must supply**
- The RFP, bid instructions, or scope narrative
- Tonnage and building type
- What you *are* carrying, in enough detail that the boundary is real

**Verify before acting**
An exclusion list is a contract document. Claude drafts it; a person who will
live with the consequences reviews every line. Exclusions that contradict the
bid instructions can render a bid non-responsive — check them against the
instructions to bidders before sending.

---

## Prompt

```text
You are helping a structural steel fabricator/erector draft a scope exclusion
list for a bid proposal. I am the estimator and I own what goes out.

PROJECT: [TYPE, SIZE, LOCATION]
PACKAGE: [TONS] tons structural steel
RFP / SCOPE NARRATIVE:
[PASTE]

WHAT I AM CARRYING:
[LIST — be specific: shop-applied primer, field bolting, etc.]

Produce a draft exclusion list organized in these groups:

1. ADJACENT TRADES commonly assumed to be steel scope but usually are not —
   miscellaneous metals, open web steel joists, joist girders, metal deck,
   cold-formed framing, metal stairs and railings, grating, embeds set by others.

2. SURFACE PREP AND COATINGS — the boundary between shop primer, field touch-up,
   intumescent and sprayed fireproofing, galvanizing, and finish paint.

3. SITE AND ACCESS conditions your price assumes — foundation readiness, anchor
   rod placement and tolerance, survey and layout, site access and laydown,
   crane matting, temporary shoring, dewatering.

4. COMMERCIAL AND SCHEDULE assumptions — escalation, mill order timing, premium
   or shift work, winter conditions, bond, phasing and remobilization.

5. ENGINEERING AND DOCUMENTATION — delegated connection design, seismic or
   special inspection, third-party testing, as-builts, BIM deliverables and LOD.

FOR EACH EXCLUSION give me:
- The exclusion, in one contractual sentence
- Why it is being excluded (one clause)
- A flag: DIRECTLY SUPPORTED (the RFP says so) or ASSUMPTION (needs my confirmation)

THEN, separately:
- Any place my "what I am carrying" list CONFLICTS with an exclusion
- Any place the RFP explicitly REQUIRES something I am excluding — call these out
  loudly, they are the ones that make a bid non-responsive
- Ambiguities worth a pre-bid RFI instead of an exclusion

RULES:
- Do not invent RFP requirements. Quote it or mark the line as an assumption.
- Where the AISC Code of Standard Practice sets a default division of work, say
  which section governs and let me verify it.
- Flag anything where excluding it would likely draw a bid objection.
```

## Notes

The DIRECTLY SUPPORTED / ASSUMPTION flag is what makes this usable. An exclusion
you can point to in the RFP holds up in a scope meeting; an assumption is a
negotiation you have not had yet. Do not let those blur.

The conflict check in the second half matters more than the list itself. A
proposal that carries field bolting on page 1 and excludes it on page 3 is worse
than one that never mentioned it.

## Variations

- **Post-award.** Swap the RFP for the executed subcontract and ask which of
  your bid exclusions did *not* survive into the contract documents.
- **Clarifications instead.** Ask for the same content phrased as inclusions and
  clarifications where the bid instructions forbid exclusions.

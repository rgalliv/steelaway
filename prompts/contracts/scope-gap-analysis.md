# Scope Gap Analysis

**Use when** the contract is signed and you want to know what you agreed to that
nobody priced.

**You must supply**
- The executed contract scope, exhibits included
- The drawing and spec set, or the relevant sections
- Your estimate's scope basis — what you actually priced

**Verify before acting**
A gap Claude flags is a candidate. Confirm each against the documents before it
becomes a change order request; a claimed gap that turns out to be covered
damages your credibility on the ones that are real.

---

## Prompt

```text
You are comparing contracted scope against the design documents and my estimate
to find gaps, overlaps, and ambiguities. I am the project manager.

CONTRACT SCOPE (including exhibits):
[PASTE]

DESIGN DOCUMENTS (relevant sheets and spec sections):
[PASTE OR SUMMARIZE]

WHAT I PRICED:
[ESTIMATE SCOPE BASIS]

Produce four lists:

1. IN DOCUMENTS, NOT IN MY ESTIMATE. Work the drawings or specs require that my
   estimate does not appear to carry. For each: what it is, where it appears
   (sheet or section), and whether the contract scope language plausibly covers
   it. These are unpriced obligations and they are the expensive ones.

2. IN MY ESTIMATE, NOT IN DOCUMENTS. Work I priced that the documents may not
   require. Either margin or a misread — worth knowing which.

3. AMBIGUOUS ALLOCATION. Work that could reasonably be read as mine or as
   another trade's. For each: the competing readings, the language driving the
   ambiguity, and what document would resolve it. These are the ones to settle
   in writing early, while everyone is still agreeable.

4. DOCUMENT CONFLICTS. Where contract scope, drawings, and specs disagree with
   each other. Quote both sides. Note the order-of-precedence clause if the
   contract has one and say which document it makes controlling.

Common boundaries to check specifically: miscellaneous metals, embeds and who
sets them, anchor rods and placement tolerance, base plates and grouting,
metal deck, shear studs, joists, stairs and railings, fireproofing surface prep,
galvanizing, connection design responsibility, field welding vs bolting,
touch-up paint, temporary bracing, and erection aids left in place.

FOR EACH ITEM: cite the document and location. Rate cost exposure
HIGH / MEDIUM / LOW and say why.

RULES:
- Do not assume industry custom settles an allocation. If the documents are
  silent, the item is AMBIGUOUS, and say the documents are silent.
- Where the AISC Code of Standard Practice provides a default division of work,
  name the topic so I can check the current text — do not quote it from memory.
- Distinguish what a document REQUIRES from what it merely SHOWS. A detail on a
  drawing is not automatically in scope.
- Flag anything where being wrong is expensive, even at low confidence, and say
  your confidence is low.
```

## Notes

The last rule inverts the usual instruction. On scope gaps a false positive costs
an hour of checking; a false negative costs the item. Surface the uncertain ones
and label the uncertainty.

Item 3 is the one to act on immediately. Ambiguities are cheap to resolve in
month one by email and expensive to resolve in month nine by claim.

## Variations

- **Pre-bid.** Same analysis against the bid documents, producing pre-bid RFIs
  instead of a gap register.
- **Two-party.** Add the other trade's scope and ask specifically what falls
  between the two contracts.

# Bid Comparison Matrix

**Use when** sub-bids or vendor quotes are in and each one is scoped
differently, which is always.

**You must supply**
- Every quote, in full — a summary page hides the exclusions that matter
- Your own scope basis, so "complete" has a definition
- Quantities the quotes are priced against, if unit rates are involved

**Verify before acting**
Claude normalizes what it is shown. A quote that is silent on an item is not the
same as one that excludes it — the model will flag silence, but only you can call
the vendor. Never award on the normalized number alone.

---

## Prompt

```text
You are normalizing competing quotes for a structural steel scope so they can be
compared on one basis. I am the estimator; I make the award.

MY SCOPE BASIS (what "complete" means for this package):
[LIST]

QUANTITY BASIS: [TONS / PIECES / SQ FT AS APPLICABLE]

QUOTES:
--- VENDOR A ---
[PASTE FULL QUOTE]
--- VENDOR B ---
[PASTE FULL QUOTE]
--- VENDOR C ---
[PASTE FULL QUOTE]

Produce:

1. NORMALIZATION TABLE. Rows are line items from my scope basis. Columns are
   vendors. Each cell is one of:
     INCLUDED (with the vendor's price if separately stated)
     EXCLUDED (quote says so explicitly — quote the words)
     SILENT (quote does not address it)
     CONDITIONAL (included subject to a qualification — state the qualification)

2. ADJUSTED COMPARISON. Start from each vendor's stated number. List the
   adjustments needed to bring them to a common basis. Where an adjustment
   requires a price I have not given you, write PRICE UNKNOWN and do not fill in
   a guess. Show the adjusted total with unknowns listed separately, never
   silently zeroed.

3. COMMERCIAL TERMS side by side: validity period, escalation, payment terms,
   retention, lead time, delivery basis (FOB point), who pays freight, bonding.

4. RISK FLAGS. For each vendor: exclusions that push work back to me, unusual
   conditions, tolerance or acceptance language that differs from spec,
   schedule commitments that conflict with my erection sequence.

5. CALL LIST. The specific question to ask each vendor to close each SILENT or
   CONDITIONAL cell. One line per question, addressed to a vendor.

RULES:
- SILENT is never converted to INCLUDED or EXCLUDED by inference. Flag it.
- Do not recommend an award. Show me the comparison; the decision is mine.
- If a quote is internally contradictory, quote both passages and flag it.
- Preserve the vendors' own words for anything you characterize as an exclusion.
```

## Notes

The SILENT category is the entire value of this template. Most bid-day mistakes
are not misread prices — they are items nobody priced because no document said
who owned them.

Note that the prompt forbids recommending an award. That is deliberate. The
normalization is mechanical and Claude is good at it; the award weighs
relationship, past performance, and risk appetite that are not in the documents.

## Variations

- **Unit-rate work.** Add: "Where vendors quoted unit rates, extend each against
  my quantities and show both the unit rate and the extension. Flag any rate
  more than 25% from the median."
- **Single-vendor scrub.** One quote against your scope basis, to find gaps
  before it becomes the only bid you have.

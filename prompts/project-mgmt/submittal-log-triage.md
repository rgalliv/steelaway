# Submittal Log Triage

**Use when** the log has grown past the point where you can see what is actually
holding fabrication.

**You must supply**
- The log: item, spec section, date submitted, current status, date returned, revision
- Your fabrication and delivery milestones with dates
- Contract review durations, and whether they run in calendar or business days

**Verify before acting**
Claude reads the log you paste. A log that is out of date produces confident,
wrong triage. Reconcile against the actual transmittals first.

---

## Prompt

```text
You are triaging a structural steel submittal log to find what is blocking
fabrication. I am the project manager.

SUBMITTAL LOG:
[PASTE: item, spec section, submitted, status, returned, revision]

TODAY: [DATE]
CONTRACT REVIEW DURATION: [N] [CALENDAR/BUSINESS] days
FABRICATION MILESTONES:
[SEQUENCE OR AREA -> RELEASE-TO-FAB DATE -> DELIVERY DATE]

Produce:

1. BLOCKING NOW. Items not approved whose fabrication milestone is within
   [N] weeks. Sort by milestone date. For each: item, days outstanding, who
   holds it, which milestone it blocks, days of float remaining (negative if
   already late).

2. OVERDUE WITH REVIEWER. Items out longer than the contract review duration.
   Give days outstanding and days beyond contract. These are the escalation list.

3. REVISION SPIRAL. Anything at revision 2 or higher. Repeated rejection is
   usually a scope or interpretation disagreement, not a drafting problem — flag
   each for a conversation rather than another resubmittal.

4. NOT YET SUBMITTED. Items on the log with no submitted date whose milestone is
   approaching. These are mine, not the reviewer's, and they are the easiest to
   miss.

5. SEQUENCE RISK. Where an approval chain has dependencies (connection design
   before shop drawings, mill certs before fabrication), flag chains where an
   upstream item is late enough to make downstream dates unachievable even if
   review is instant.

6. THIS WEEK. The five actions that most reduce schedule risk, each naming who
   to contact and what to ask for.

RULES:
- Compute every duration from the dates I gave you. Show the arithmetic on
   anything you call late.
- Distinguish clearly between what I owe and what the reviewer owes.
- If a status is ambiguous or a date is missing, list it under DATA GAPS rather
  than assuming.
- Do not recommend fabricating ahead of approval. If that is the only way to
  hold a date, say the date is at risk and let me make that call.
```

## Notes

Section 4 is the one people skip and the one that bites. A log tracks what you
sent; it is silent about what you have not, and silence reads as "fine" right up
until the milestone.

The last rule matters commercially. Fabricating on unapproved drawings is
sometimes the right business decision, but it is a decision with money attached
and it belongs to a person, not a prompt.

## Variations

- **Weekly report.** Add: "Write a five-line summary for the owner's meeting:
  count approved, count outstanding, count overdue, the single largest risk, and
  what I need from the design team this week."
- **Look-ahead.** Add fabrication start dates and ask what must be approved in
  each of the next four weeks to keep the shop loaded.

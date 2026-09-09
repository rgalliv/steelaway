# Delivery and Milestone Plan

**Use when** converting the erection sequence and fabrication status into a
traceable delivery plan with owners and decision dates.

**You must supply**
- Approved or proposed erection sequence and required-on-site dates
- Mark/lot mapping, fabrication forecast, and coating or inspection durations
- Truck, route, site access, laydown, and unloading constraints
- Contract milestones and calendars

**Verify before acting**
Claude can sequence supplied data and expose conflicts. The fabricator,
transporter, erector, superintendent, and lift-planning team approve their own
commitments. This template does not determine transport legality, crane
capacity, rigging, or safe unloading methods.

---

## Prompt

```text
You are building a structural steel delivery and milestone coordination plan.

ERECTION SEQUENCE / NEED DATES: [PASTE]
MARK-TO-LOT MAP: [PASTE]
FABRICATION FORECAST: [PASTE]
COATING / INSPECTION / RELEASE STEPS: [PASTE]
TRANSPORT CONSTRAINTS: [PASTE]
SITE ACCESS / LAYDOWN / UNLOADING CONSTRAINTS: [PASTE]
CONTRACT MILESTONES AND CALENDARS: [PASTE]

Build:

1. MILESTONE REGISTER — contractual date, internal control date, current
   forecast, variance in working days, source, owner, and status.
2. DELIVERY WAVES — wave/lot, marks or areas, earliest ready date, required-on-
   site date, transport lead time supplied by me, and release decision date.
3. PREDECESSORS — approved information, material, fabrication, coating,
   inspection, transport, access, laydown, unloading plan, and receiving crew.
4. CONFLICTS — sequence mismatch, impossible date logic, mixed revisions,
   missing marks, early delivery with no laydown, or late delivery with no float.
5. LOOKAHEAD — actions and confirmations due in 2 weeks, 6 weeks, and 12 weeks.
6. CHANGE CONTROL — what event would require re-baselining and who approves it.

Show the critical source data behind every flagged date. Use CALENDAR DAYS or
WORKING DAYS exactly as I specify and state which one each calculation uses.

RULES:
- Do not invent transit, fabrication, coating, inspection, or unloading durations.
- Do not approve a delivery, pick, route, or unloading method.
- Do not call a date committed unless the responsible party supplied it.
- Keep contractual milestones, internal targets, and forecasts distinct.
- Mark missing predecessors as OPEN rather than assuming they will occur.
```

## Notes

The release decision date is often more useful than the delivery date. It tells
the team when uncertainty must be resolved while there is still time to act.

## Variations

- **Three-week field lookahead.** Filter to deliveries required in the next 21
  days and list only confirmations the site and shop owe each other.
- **Resequence comparison.** Compare original and proposed waves and identify
  affected lots, approvals, vendors, site constraints, and milestone risk.

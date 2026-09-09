# Walkthrough: Takeoff Validation

Illustrative. Fictional project, invented numbers. Every figure below has been
checked so the example actually adds up — a worked example that does not is worse
than none.

---

## Input

A partial takeoff with two planted problems.

```
MARK    SHAPE      LENGTH   QTY   UNIT WT   LINE WT
B-101   W21x44     30'-0"    12    44        15,840
B-102   W21x44     28'-6"     8    44        10,032
B-103   W24x68     42'-0"     6    68        17,136
B-104   W16x31     22'-0"    14    31         8,548
C-201   W14x90     14'-0"    22    90        27,720
C-202   W14x90     14'-0"    22    90        27,720
B-105   W18x50     26'-0"     9    50        11,700
B-106   W12x26     18'-0"    16    26         7,488
G-301   W30x99     45'-0"     4    99        17,820

MY REPORTED TOTAL: 72.0 tons
DRAWING SET: S-201 through S-208, Rev 3, dated 2026-04-14
```

## What came back

**Finding 1 — line weight error, B-104 (exceeds threshold)**

> 22'-0" x 14 x 31 lb/ft = **9,548 lb**
> Your line reads **8,548 lb**
> Understated by 1,000 lb — **10.5%**, well over your 2% threshold.
>
> Transposition or a dropped digit. All other lines recompute correctly.

**Finding 2 — duplicate mark, identical geometry**

> `C-201` and `C-202` are separate marks with identical shape, length, and
> quantity (W14x90, 14'-0", qty 22). This may be correct — two column lines
> framed the same — or one line entered twice under two marks.
> **44 columns, 27,720 lb of potential double-count.** Confirm against the
> column schedule.

**Finding 3 — total rollup**

> Sum of your line weights as written: 144,004 lb = **72.00 tons**. This ties to
> your reported total, so the rollup itself is sound.
>
> Correcting B-104: 145,004 lb = **72.50 tons**.
> **The package is 0.5 tons heavier than reported.**

**Omission prompts**

> Absent from this data and normally carried on a structural takeoff — confirm
> each is out of scope or add it:
> base plates · stiffeners and doubler plates · connection material · anchor
> rods · shear studs · bracing · embeds · bolts · weld metal · shop primer or
> galvanizing
>
> I have not added tonnage for any of these.

## What the estimator did

Both findings were real, and they pushed in opposite directions.

**B-104** was a straightforward keying error. Corrected, the package went up
0.5 tons.

**C-202** was the more valuable catch. Checked against the column schedule, the
second column line is W14x82, not W14x90 — a copy-paste that never got edited.
At 14'-0" x 22 x 82 that line is 25,256 lb, not 27,720. Correcting it took
**1.23 tons back out**.

Net movement: up 0.5, down 1.23, for a corrected package of roughly 71.3 tons
against 72.0 reported. Under a point either way — but on a hard bid, a ton is
a real number, and two errors that happened to partly cancel would have hidden
each other in any check that only looked at the total.

## What it did not do

It did not know `C-202` was wrong — only that two marks were suspiciously
identical. Settling it meant opening the column schedule. That is the division of
labor this whole library assumes: the tool finds candidates, the drawings decide.

It also did not check whether any member is correct for its condition. No
arithmetic pass can. That is a drawing comparison and an engineering question,
and it stays with people.

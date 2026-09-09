# Shape Designations

## Reading a callout

A rolled shape designation encodes its nominal size and, for most families, its
nominal weight per foot.

```
W 24 x 68
│  │    └── nominal weight, 68 lb per linear foot
│  └─────── nominal depth, approximately 24 inches
└────────── shape family, wide flange
```

**This is definitional, not a lookup.** `W24x68` is 68 lb/ft *by designation*.
That is why the takeoff-validation prompt can check line-weight arithmetic
without any table: it multiplies length by quantity by the number in the name.

## Families

| Prefix | Family |
|---|---|
| `W` | Wide flange |
| `S` | American standard beam |
| `HP` | Bearing pile |
| `M` | Miscellaneous |
| `C` | American standard channel |
| `MC` | Miscellaneous channel |
| `L` | Angle |
| `WT`, `ST`, `MT` | Tee, cut from the corresponding beam |
| `HSS` | Hollow structural section |
| `Pipe` | Steel pipe |

Angles and HSS are dimensioned differently — an angle by leg lengths and
thickness (`L4x4x1/2`), an HSS by outside dimensions and wall thickness
(`HSS8x8x1/2`). Their weight is **not** in the designation, so the arithmetic
check that works for W-shapes does not apply. Get those from the tables.

## What the designation does not tell you

- **Actual depth.** Nominal 24 is not measured 24. Members in a W-family group
  share a nominal depth while differing in actual dimensions.
- **Section properties.** Area, moment of inertia, section modulus, radius of
  gyration — tables only.
- **Grade.** `A992`, `A572 Gr. 50`, `A36` and others are specified separately and
  affect price, availability, and weldability.
- **Availability.** A valid designation may not be rollable on your schedule.
  That is a mill and service-center question.

## Using this with Claude

Safe: parsing designations, checking weight arithmetic for W/S/HP/M/C/MC,
spotting malformed callouts, finding duplicate marks with conflicting shapes.

Not safe: asking for section properties, capacities, or actual dimensions from
memory. Those come from the current AISC Manual. If a prompt returns one, treat
it as unverified until you have opened the book.

# Steel Away

A comprehensive guide and toolkit for structural steel project managers leveraging Claude AI to streamline estimating, project coordination, and field operations.

---

## Overview

**Steel Away** bridges the gap between AI technology and the structural steel industry. This repository provides ready-to-use prompts, workflows, and best practices designed specifically for steel project managers, estimators, and field coordinators who want to work faster and smarter with Claude AI.

Whether you're preparing bid packages, tracking RFIs, managing submittals, or coordinating erection schedules — this toolkit helps you get more done with less effort.

## Key Features

- **Steel Estimating Assistance** — Generate material takeoffs, cross-reference AISC shapes, and validate tonnage calculations
- **Bid Package Preparation** — Automate scope summaries, exclusion lists, and bid comparison matrices
- **RFI & Submittal Management** — Draft professional RFI responses and track submittal status
- **Project Scheduling** — Create and update erection sequences, delivery schedules, and milestone trackers
- **Field Coordination** — Generate daily reports, safety documentation, and punch list tracking
- **Contract Review** — Identify risk clauses, scope gaps, and change order opportunities

## Who This Is For

| Role | How You'll Use It |
|------|-------------------|
| **Project Managers** | Bid prep, scheduling, contract review, client communication |
| **Estimators** | Takeoff validation, cost analysis, historical data comparison |
| **Detailers** | Connection design queries, code lookups, drawing coordination |
| **Field Superintendents** | Daily reports, safety docs, erection sequencing |
| **Project Engineers** | RFIs, submittals, change order documentation |

## Getting Started

### Prerequisites

- A [Claude](https://claude.ai) account (Pro or Team recommended for heavy usage)
- Basic familiarity with structural steel terminology and workflows
- Optional: [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) for advanced automation

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/rgalliv/steelaway.git
   cd steelaway
   ```

2. **Browse the prompt library** — Start with [`prompts/`](prompts/) for ready-to-use
   templates, or read [`docs/getting-started.md`](docs/getting-started.md) first if
   this is new to you

3. **Customize for your shop** — Adapt templates to match your company's standards, preferred vendors, and regional codes

## Repository Structure

```
steelaway/
├── prompts/                # Ready-to-use prompt templates
│   ├── estimating/         # Takeoff and bidding prompts
│   ├── project-mgmt/       # Scheduling and coordination
│   ├── field-ops/          # Field reports and safety
│   └── contracts/          # Contract review and change orders
├── workflows/              # Multi-step AI workflows
├── examples/               # Real-world usage examples
├── references/             # AISC tables, code references
└── docs/                   # Detailed documentation
```

### Where to start

| If you want to | Go to |
|---|---|
| Understand how to use this | [`docs/getting-started.md`](docs/getting-started.md) |
| Find a template for a task | [`prompts/README.md`](prompts/README.md) |
| See what output looks like | [`examples/`](examples/) |
| Chain several prompts | [`workflows/`](workflows/) |
| Write your own | [`docs/writing-prompts.md`](docs/writing-prompts.md) |
| Know what must be double-checked | [`references/verification.md`](references/verification.md) |
| Handle sensitive documents | [`docs/data-handling.md`](docs/data-handling.md) |

**One rule runs through all of it:** Claude drafts, organizes, checks arithmetic,
and asks the questions a careful reviewer would ask. It does not produce
engineering judgment, legal advice, or a safety determination. The licensed
engineer, the attorney, and the competent person remain the deciders in their
lanes — see [`references/verification.md`](references/verification.md).

## Example Use Cases

### Generate a Bid Exclusion List
> *"Review this RFP for a 500-ton structural steel package. Generate a comprehensive exclusion list covering miscellaneous metals, open web joists, metal deck, and any items that fall outside standard structural steel scope per AISC Code of Standard Practice."*

### Validate a Material Takeoff
> *"I have a takeoff with 47 W-shapes totaling 312 tons. Cross-check the member weights against AISC 16th Edition tables and flag any discrepancies greater than 2%."*

### Draft an RFI
> *"Draft a professional RFI to the structural engineer regarding unclear connection details at grid intersection B3/Level 2. Reference drawing S-301 Rev 2 and note the conflict between the W24x68 beam and the existing HSS column."*

## Best Practices

1. **Be specific** — Include project details, drawing references, and exact member sizes
2. **Provide context** — Tell Claude your role, project phase, and what decisions depend on the output
3. **Verify outputs** — Always cross-check AI-generated calculations against AISC tables and project documents
4. **Iterate** — Refine prompts based on results; save effective prompts for reuse
5. **Protect sensitive data** — Never share proprietary bid numbers, client contracts, or confidential pricing

## Tech Stack

| Tool | Purpose |
|------|---------|
| [Claude AI](https://claude.ai) | Core AI assistant |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | CLI-based automation |
| Markdown | Documentation and prompt templates |
| Git | Version control and collaboration |

## Contributing

Contributions from steel industry professionals are welcome. If you have prompts, workflows, or use cases that have worked well for your team:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-contribution`)
3. Commit your changes (`git commit -m "Add: description of contribution"`)
4. Push to the branch (`git push origin feature/your-contribution`)
5. Open a Pull Request

Please ensure all contributions are relevant to the structural steel industry and follow the existing formatting conventions.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- [AISC](https://www.aisc.org/) — American Institute of Steel Construction
- [Anthropic](https://www.anthropic.com/) — Creators of Claude AI
- The structural steel professionals who contributed real-world use cases and feedback

---

<p align="center">
  <strong>Built for the steel industry, by steel professionals.</strong><br>
  <sub>Questions or suggestions? Open an issue or start a discussion.</sub>
</p>

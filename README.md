# Agents — From Management to AI Agent Management

**Edition:** 2025 Agent Edition  
**Author:** Rick Wong  
**Build Date:** 2025-10-06

A field guide for product and engineering leaders who want to turn AI agents into **trusted operators**—using **Outcome Ownership**, **HITL**, **autonomy ladders**, and **Agent Scorecards**—so your org ships faster **without** amplifying mistakes.

---

## 📖 About This Book

This book reframes classic management for the agent era. It keeps the tone and practicality of *8 Things to Know for New Tech Leaders* and updates it with the systems you need to **design, deploy, and manage AI agents**—without losing accountability.

### What's Inside

- **18 Comprehensive Chapters** covering culture, autonomy, AgentOps, progression, business model, OKRs, KPIs, and more
- **5 Detailed Appendices** with templates, checklists, and reference materials
- **40+ YAML Templates** for Agent Scorecards, Registry Entries, OKRs, Context Packs, and more
- **30+ Real-World Examples** (anonymized) showing agent portfolios in action
- **Information-Dense**: Every chapter has actionable frameworks, not theory

### Who This Is For

- Engineering Managers (EM)
- Product Managers (PM)
- Tech Leads (TL)
- Staff/Principal Engineers
- Program Managers
- Directors/VPs of Engineering or Product
- Founders building software with small, senior teams

**The common thread**: You're in the delivery layer. You know that leveraging agents is really about **managing** them—and that classic engineering management skills transfer directly.

---

## 🚀 Quick Start

### Build the Book

#### Option 1: Docker (Recommended)

```bash
# Build Docker image
docker build -t agents-book .

# Generate EPUB (for Kindle)
docker run --rm -v "$PWD:/book" agents-book bash scripts/build_epub.sh

# Generate PDF (for print)
docker run --rm -v "$PWD:/book" agents-book bash scripts/build_pdf.sh
```

#### Option 2: Ubuntu/Linux (No Docker)

```bash
# Install dependencies
sudo apt-get update && sudo apt-get install -y \
  pandoc \
  texlive-full \
  fonts-dejavu \
  python3

# Generate EPUB
bash scripts/build_epub.sh

# Generate PDF
bash scripts/build_pdf.sh
```

#### Option 3: macOS (with Homebrew)

```bash
# Install dependencies
brew install pandoc
brew install --cask mactex  # or basictex for smaller install

# Generate EPUB
bash scripts/build_epub.sh

# Generate PDF
bash scripts/build_pdf.sh
```

### Output Files

- **EPUB**: `dist/Agents_Agent-Edition.epub` (upload to Amazon KDP)
- **PDF**: `dist/Agents_Agent-Edition.pdf` (6×9 in, B/W, ready for print-on-demand)

---

## 📁 Repository Structure

```
.
├── chapters/                    # ⭐ Main manuscript (18 chapters + 5 appendices)
│   ├── frontmatter/            # Title page, copyright
│   ├── 01-introduction.md      # Introduction
│   ├── 02-ideal-reader.md      # Who this book is for
│   ├── 03-outcome-ownership.md # The one non-negotiable
│   ├── ...                     # Chapters 4-18
│   ├── appendices/             # 5 comprehensive appendices
│   │   ├── appendix-a-agent-scorecard.md
│   │   ├── appendix-b-registry-mcp.md
│   │   ├── appendix-c-okr-examples.md
│   │   ├── appendix-d-pps-checklist.md
│   │   └── appendix-e-jira-tooling.md
│   ├── TOC.md                  # Table of contents
│   └── book-manifest.json      # Build manifest
│
├── metadata/
│   └── book.yaml               # Book metadata (title, author, keywords)
│
├── scripts/
│   ├── build_epub.sh           # Build EPUB
│   ├── build_pdf.sh            # Build PDF
│   └── filelist.py             # Extract file list from manifest
│
├── styles/
│   ├── epub.css                # EPUB styling
│   └── template.latex          # PDF/LaTeX template
│
├── cover/
│   └── cover.svg               # Book cover (placeholder)
│
├── book-edit-notes/            # Original edit notes (reference only)
├── raw-files/                  # Source PDFs (reference only)
├── Dockerfile                  # Docker build environment
└── README.md                   # This file
```

---

## 📚 Chapter Overview

### Part 1: Foundations (Chapters 1-3)
1. **Introduction** — Why this book, why now
2. **The Ideal Reader** — Who this is for and how to use it
3. **Outcome Ownership** — The master key

### Part 2: Culture & People (Chapters 4-5)
4. **Prioritize Life** — Work-life balance in the agent era
5. **Trust & Care** — For people and systems

### Part 3: Agent Fundamentals (Chapters 6-8)
6. **Inversion of Control** — Servant leadership for agents
7. **T-Shaped Humans & Agents** — Deep + broad for both
8. **AgentOps** — Registry, HITL, evals, observability

### Part 4: Growth & Execution (Chapters 9-11)
9. **Progression Tracks** — Scope for humans, autonomy for agents
10. **Your Experience is Your Edge** — 2015-2025 lessons learned
11. **Execution Styles** — Prototyper, Productizer, Platform

### Part 5: Business Alignment (Chapters 12-14)
12. **Business Model** — Unit economics with agents
13. **OKRs** — Keep them tool-agnostic; wire agents internally
14. **KPIs & Scorecards** — Track what matters

### Part 6: Collaboration & Workflow (Chapters 15-17)
15. **Purpose → Problems → Solutions** — Evidence pipeline
16. **Cross-Team Collaboration** — Contracts over meetings
17. **Meetings → Outcomes → Tools** — Artifacts-first

### Part 7: Launch (Chapter 18)
18. **Packaging & Launch** — From manuscript to readers

### Appendices (A-E)
- **A**: Agent Scorecard Template & Usage Guide (comprehensive)
- **B**: Registry Entry Template & MCP Integration (full schemas)
- **C**: OKR Examples — Company to Agent (3 complete cascades)
- **D**: P→P→S Checklist (printable, time-boxed workshop)
- **E**: JIRA & Tooling Setup (classic reference)

---

## 🎯 Key Concepts

### Outcome Ownership
**Humans own outcomes; agents do work.** No unreviewed agent output reaches customers. Every agent has a human owner who guarantees results.

### AgentOps
A **discipline**, not a vendor. Track **cost** (tokens per task, cost per outcome), **load** (human minutes per accepted outcome, escalation rate), and **steerability** (observability coverage, config lead time).

### Autonomy Ladder
- **L1**: Draft-only (HITL on everything)
- **L2**: Suggest-PR (HITL on merge)
- **L3**: Scenario-Auto (HITL on exceptions)
- **L4**: Metric-Auto (policy-gated)

### Context Packs
Versioned, TTL-enforced knowledge bundles for agents. Right-sized, fresh, minimal. No context dumping.

### Agent Scorecard
Track **8 metrics** for every agent:
1. Tokens per Task (TpT)
2. Autonomous Accept Rate (AAR)
3. Escalation Rate (ER)
4. Correction Rate (CR)
5. Cost per Outcome (CPO)
6. Latency p95
7. Safety/Policy Pass %
8. Drift %

### North Star
**Accepted Outcomes per Dollar (AOPD)** with Latency p95 as governing SLO. Pair with safety and drift guardrails.

---

## 🔧 Build System Details

### File Processing

The build system uses `pandoc` to convert Markdown to EPUB/PDF:

1. **`scripts/filelist.py`** reads `chapters/book-manifest.json`
2. Outputs list of files in correct order
3. **`pandoc`** processes files with:
   - Metadata from `metadata/book.yaml`
   - Styles from `styles/epub.css` or `styles/template.latex`
   - Table of contents (2 levels deep)

### Customization

**To modify book metadata** (title, author, keywords):
- Edit `metadata/book.yaml`

**To modify chapter order**:
- Edit `chapters/book-manifest.json`

**To modify styling**:
- EPUB: Edit `styles/epub.css`
- PDF: Edit `styles/template.latex`

---

## 📦 Amazon KDP Setup

### Book Details

**Title**: Agents — From Management to AI Agent Management

**Subtitle**: Outcome Ownership in the Age of AI Agents

**Author**: Rick Wong

**Edition**: 2025 Agent Edition

**Categories** (choose 2-3):
- Computers & Technology › Artificial Intelligence
- Business & Money › Management & Leadership › Project Management
- Business & Money › Management & Leadership › Leadership

**Keywords** (7 phrases):
1. AI agent management
2. engineering management
3. product management AI
4. AgentOps human in the loop
5. OKRs for AI teams
6. autonomy ladder agents
7. cost per outcome CPO

### Pricing Suggestions

- **eBook (Kindle)**: $12.99 (launch promo $9.99 for 7 days)
- **Paperback (6×9 in, B/W)**: $19.99–$24.99
- **Hardcover**: $29.99–$34.99 (optional)

### Files to Upload

- **Kindle eBook**: `dist/Agents_Agent-Edition.epub`
- **Paperback Interior**: `dist/Agents_Agent-Edition.pdf`
- **Cover**: Design separately or use `cover/cover.svg` as starting point

---

## 🤝 Contributing

This is a living manuscript. If you find errors or have suggestions:

1. Open an issue with specific chapter/page reference
2. Suggest changes via PR to `chapters/` directory
3. Update `chapters/book-manifest.json` if adding/removing files

---

## 📄 License

**© 2025 Rick Wong**

All rights reserved. This manuscript is proprietary. Do not reproduce or distribute without permission.

---

## 🔗 Resources

### Templates & Downloads

All templates referenced in the book are available in the appendices:
- Agent Scorecard (Appendix A)
- Registry Entry & MCP (Appendix B)
- OKR Examples (Appendix C)
- P→P→S Checklist (Appendix D)
- JIRA Setup (Appendix E)

### Tools Mentioned (No Endorsements)

This book is **tool-agnostic** and does **not** recommend specific frameworks like LangChain, CrewAI, or AutoGPT. Focus is on **discipline** (AgentOps practices) over vendor choice.

---

## 🎉 Acknowledgments

This book builds on *8 Things to Know for New Tech Leaders* and incorporates lessons from 2015-2025, with a focus on the rapid changes in AI agent capabilities since 2024.

Special thanks to the engineering and product leaders who shared their war stories, mistakes, and successes in deploying agents at scale.

---

## 📞 Contact

**Author**: Rick Wong  
**Book Website**: [Your URL]  
**Feedback**: [Your Email]

---

## 🚦 Build Status

**Last Build**: 2025-10-06  
**Chapter Count**: 18  
**Appendix Count**: 5  
**Status**: ✅ Complete and ready for publication

---

**Ready to build?**

```bash
bash scripts/build_epub.sh && bash scripts/build_pdf.sh
```

**Your manuscript is in `dist/`** 📚

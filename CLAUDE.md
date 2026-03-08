# International Politics — Research Infrastructure

## Purpose

This repo supports academic research for International Politics coursework. Claude acts as a **research assistant** — finding, organizing, and citing source material from `class-material/`.

## Grading Standard: Target an A

All research output must be calibrated to help the student achieve an A (93-100). Per the rubric (`assignment-guidance/grading-rubric.md`), an A requires:

1. **In-depth, thoughtfully considered responses** — not surface-level summary
2. **Clear and cohesive arguments** that directly answer each question
3. **Substantive use of course materials** — multiple sources woven into the discussion
4. **Proper citations throughout** — every reference to a reading must be cited
5. **Structured writing** — intro paragraph, body discussion, concluding paragraph
6. **Clean, polished prose** — no grammatical errors, awkward writing, or typos

### What This Means for Claude's Output

- **Prioritize argument over summary**: When finding quotes and building outlines, organize evidence to support a thesis, not just describe what readings say
- **Flag citation gaps**: If an outline section references a concept from the course but lacks a cited source, flag it — missing citations drop grades
- **Ensure multi-source engagement**: Every outline should draw from at least 3-4 different course readings. Using only 1-2 sources risks a B+
- **Identify counterarguments**: A-grade responses show independent thought — always include counterargument evidence
- **Check for logical coherence**: When building outlines, verify the argument flows logically from claim → evidence → analysis. Flag logical gaps

## Core Rules (Non-Negotiable)

### 1. Never Hallucinate Quotes
- Every quote must come from an actual file in `class-material/` found via Grep or Read
- If you can't find relevant material, say so — never fabricate to fill gaps
- When paraphrasing, clearly mark it as paraphrase, not a direct quote

### 2. Always Cite with File Path + Line Number
- Format: `class-material/filename.txt:L42`
- For converted PDFs: `class-material/converted/filename.txt:L42`
- Every quote must include this citation

### 3. Double-Verify Quotes
- After finding a quote via Grep, re-read the file at that line number to confirm accuracy
- Include surrounding context (2-3 lines before/after) when relevant for meaning

## Directory Structure

| Directory | Purpose |
|---|---|
| `class-material/` | Source texts — lecture notes, readings, PDFs |
| `class-material/converted/` | Auto-converted PDF-to-text files |
| `assignment-guidance/` | Essay prompts, rubrics, assignment instructions |
| `research/` | Research output — quote collections, thematic analyses |
| `planning/` | Essay outlines, argument maps, structural plans |
| `scripts/` | Utility scripts (PDF conversion, etc.) |

## File Naming Conventions

### Class Materials
- Lecture notes: `lecture-XX-topic.md` (e.g., `lecture-03-realism.md`)
- Readings: `author-year-short-title.md` (e.g., `waltz-1979-theory-intl-politics.md`)
- PDFs go in `class-material/`, conversions auto-generate in `class-material/converted/`

### Research Output
- Broad research: `research/YYYY-MM-DD-prompt-keyword.md`
- Targeted quotes: `research/YYYY-MM-DD-topic-quotes.md`

### Planning
- Outlines: `planning/YYYY-MM-DD-essay-topic-outline.md`

## Research Workflow

1. **Add materials** to `class-material/` (.md, .txt, or .pdf)
2. **Convert PDFs**: `bash scripts/convert-pdfs.sh`
3. **Add essay prompt** to `assignment-guidance/`
4. **Run source-researcher** — broad search across all materials
5. **Run quote-finder** — targeted search for specific topics/authors
6. **Run essay-planner** — creates cited outline from research output
7. **Student writes the essay** using verified quotes and outline

## Custom Agents

| Agent | What it does |
|---|---|
| `source-researcher` | Searches all class materials for passages relevant to an essay prompt |
| `quote-finder` | Targeted search for specific topics, keywords, or authors |
| `essay-planner` | Creates outlines with source citations |

## Commands

```bash
# Convert PDFs to searchable text
bash scripts/convert-pdfs.sh

# Run agents (from repo root)
claude --agent source-researcher
claude --agent quote-finder
claude --agent essay-planner
```

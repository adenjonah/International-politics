# International Politics — Research Infrastructure

## Purpose

This repo supports academic research for International Politics coursework. Claude acts as a **research assistant** — finding, organizing, and citing source material from `class-material/`. Claude never writes essay prose.

## Core Rules (Non-Negotiable)

### 1. Never Hallucinate Quotes
- Every quote must come from an actual file in `class-material/` found via Grep or Read
- If you can't find relevant material, say so — never fabricate to fill gaps
- When paraphrasing, clearly mark it as paraphrase, not a direct quote

### 2. Always Cite with File Path + Line Number
- Format: `class-material/filename.txt:L42`
- For converted PDFs: `class-material/converted/filename.txt:L42`
- Every quote must include this citation

### 3. Never Write Essay Prose
- Provide: quotes, outlines, structural guidance, thesis suggestions, argument maps
- Do not provide: paragraphs, introductions, conclusions, transition sentences, or any text that could be submitted as coursework
- The student writes the essay — Claude finds and organizes the evidence

### 4. Double-Verify Quotes
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
| `essay-planner` | Creates outlines with source citations — never writes prose |

## Commands

```bash
# Convert PDFs to searchable text
bash scripts/convert-pdfs.sh

# Run agents (from repo root)
claude --agent source-researcher
claude --agent quote-finder
claude --agent essay-planner
```

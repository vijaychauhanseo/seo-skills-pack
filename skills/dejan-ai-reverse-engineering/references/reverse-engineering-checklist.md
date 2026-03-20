---
source: https://dejan.ai
title: AI Search Reverse-Engineering Checklist
scraped: 2026-03-20
tags: reverse engineering, checklist, grounding, selection rate, fan out, diagnosis
topic: ai_reverse_engineering
intent: diagnosis, reverse_engineering, workflow
role: pinchy, coral, researcher
confidence: high
canonical: true
canonical_group: AI reverse engineering checklist
use_for: diagnostic_workflow, grounding_review, fan_out_testing, answer_selection
avoid_for: generic_link_building, customer_support
---

# AI Search Reverse-Engineering Checklist

Use this when the task is practical and diagnostic rather than purely conceptual.

## Goal Framing

Write down which layer you are trying to reverse engineer:

- Retrieval: which sources get surfaced at all
- Selection: which sources or snippets get chosen into the answer
- Rendering: how the model phrases, cites, or orders the answer
- Latent bias: what the model already "believes" before grounding

## Minimal Workflow

1. Capture the exact user-visible prompt.
2. Generate likely hidden fan-out or implicit sub-queries.
3. Record the retrieved sources, ranking positions, and cited sources separately.
4. Extract the exact sentences or blocks that appear to have been grounded.
5. Compare source-page wording against cited wording.
6. Estimate how much of the page survives extraction.
7. Rewrite one candidate passage into a short, factual, self-contained block.
8. Retest and compare whether selection changes.

## What To Inspect On Pages

- Front-loaded answer sentences
- Standalone factual claims
- Boilerplate surrounding the main claim
- Readability after distillation or reader-mode extraction
- Explicit entity naming and disambiguation
- Internal contradictions or fluff that may dilute snippet quality

## DEJAN-Flavored Questions

- Is the page ranking but not being selected?
- Which exact sentence is doing the work?
- Does the page survive distillation cleanly?
- Is failure caused by weak retrieval, weak snippet extraction, or weak latent entity bias?
- Is a competitor winning because of better structure rather than better rank?
- Is the system grounding on a claim that is merely present, not trustworthy?

## Output Template

Use this structure for future analyses:

```text
Prompt:
Observed system:
Likely hidden fan-out:
Retrieved sources:
Cited/grounded sources:
Winning snippets:
Estimated extraction pattern:
Selection-rate hypothesis:
Primary-bias hypothesis:
Recommended content or structure changes:
```

## Fast Heuristics

- A page can rank and still lose if its best sentence is buried.
- A weak page can win if it offers a cleaner extractable sentence.
- Citation presence is not proof of authority.
- If the model keeps using similar wording across prompts, inspect latent bias rather than only retrieval.
- If results vary heavily, inspect transient grounding and prompt-dependent fan-out.

---
source: https://dejan.ai
title: DEJAN AI Reverse Engineering Notes
scraped: 2026-03-20
tags: ai reverse engineering, grounding, selection rate, fan out, ai mode, reverse prompting
topic: ai_reverse_engineering
intent: research, reverse_engineering, ai_selection
role: pinchy, coral, researcher
confidence: high
canonical: true
canonical_group: DEJAN research digest
use_for: reverse_prompting, ai_mode, selection_rate, grounding_snippets, model_bias
avoid_for: generic_link_building, customer_support
---

# DEJAN AI Reverse Engineering Notes

Snapshot date: 2026-03-20
Primary source domain: `https://dejan.ai`
Focus: AI SEO, grounding behavior, machine readability, model bias, and reverse engineering.

## Quick Read

- DEJAN's core shift is from classic ranking analysis toward `selection`: what text survives retrieval and gets chosen into an LLM answer.
- The most useful DEJAN lens for technical reverse engineering is: inspect grounding artifacts, snippet budgets, hidden query fan-out, and model bias together.
- Latest surfaced DEJAN post in this pass: `Reverse Prompting: Reconstructing Prompts from AI-Generated Text` dated 2026-03-18.

## Latest Relevant Posts

### 2026-03-18: Reverse Prompting: Reconstructing Prompts from AI-Generated Text

- DEJAN fine-tuned Google's Gemma 3 270M to infer likely prompts from AI-generated responses.
- The post says DEJAN generated 100,000 synthetic prompt-response pairs with Gemini 2.5 Flash, trained for one epoch on a consumer GPU, and built a Streamlit app with 24 decoding configurations.
- Why it matters: this is directly useful for reverse-engineering workflows where you need to infer prompting patterns, prompt classes, or hidden operator instructions from generated output.

### 2026-03-15: Rufus - Under the Hood. What Drives Amazon's AI Shopping Assistant?

- Framed as a pipeline/orchestration problem, not "one magic model."
- Useful reminder that ecommerce assistants combine retrieval, context assembly, memory, and response generation rather than pure generation.

### 2026-03-12: Is Query Length a Reliable Predictor of Search Volume?

- DEJAN's answer is explicit: no, query length is not a reliable predictor on its own.
- Useful counterweight against simplistic head-vs-long-tail heuristics in ecommerce or AI query forecasting.

### 2026-03-06: Search Grounding is Transient

- DEJAN argues that grounded content should not be treated as durable model memory.
- Working implication: optimize for immediate extraction and answer shaping, not assumed long-term retention inside the model.

## Core Mental Models

### 1. SRO over CTR

Source: `SRO & Grounding Snippets` (2026-03-01)

- `SRO` means Selection Rate Optimization.
- DEJAN positions SRO as the AI-native successor to click-through-rate optimization.
- The unit of competition changes from "who gets the click" to "which source or sentence gets selected into the answer."

### 2. Grounding Is Selective, Not Full-Page Reading

Sources:
- `What extraction method is Google using to build grounding snippets?` (2026-02-24)
- `How big are Google's grounding chunks?` (2025-12-20)
- `How much of your content survives the AI Search filter?` (2025-11-08)
- `How GPT Sees the Web` (2025-11-14)

- DEJAN repeatedly argues that Google/Gemini do not ingest full pages in the way humans read them.
- The 2025-11-08 article reports roughly one third of page content surviving into cited text on DEJAN's sample.
- `How GPT Sees the Web` frames web access as windowed and selective rather than page-faithful browsing.
- Operational rule: identify the exact sentence blocks, not the whole article, that are likely to survive extraction.

### 3. Selection Rate Is Shaped by Primary Bias

Source: `Primary Bias on Selection Rate in AI Search` (2025-09-04)

- DEJAN defines `selection rate` as the frequency with which an available grounding candidate gets chosen into the answer.
- `Primary bias` is the model's internal relevance perception of the grounding entity.
- The article argues this latent bias can outweigh on-page adjustments and may move slowly because it is tied to model training and fine-tuning cycles.

### 4. Hidden Query Fan-Out Matters

Sources:
- `Implicit Queries in AI Search` (2026-02-24)
- `Fan-Out Query Search Volume Prediction Using Deep Learning` (2025-08-30)

- DEJAN's framing implies the visible prompt is often decomposed into hidden sub-queries or fan-out tasks.
- Reverse engineering should inspect not just the explicit user wording, but the likely latent queries the system runs behind the scenes.

### 5. LLMs Are Presentation Layers on Top of IR Systems

Source: `LLM is a Presentation Layer in AI Search` (2025-09-21)

- DEJAN rejects the idea that LLMs replaced crawling, indexing, retrieval, and ranking.
- Better working model: classic IR still provides candidate generation; the LLM handles presentation, reasoning, and synthesis.
- For diagnostics, separate problems in retrieval from problems in answer assembly.

### 6. Machine Readability Is a Real Proxy

Sources:
- `Annotated Page Content (APC)` (2025-09-22)
- `Deconstructing DomDistiller: How Chrome's Reader Mode Algorithm Impacts Technical SEO` (2025-09-22)
- `WebMCP` (2026-02-10)

- DEJAN treats reader-mode-style extraction, structured content blocks, and tool-facing interfaces as practical proxies for how AI systems can consume pages.
- If the main claim disappears under distillation, extraction, or tool mediation, visibility risk is high.

### 7. AI Search Can Be Manipulated

Source: `AI Search Has a Spam Problem` (2026-02-18)

- DEJAN's argument: grounding validates that a claim exists in a source, not that the source is honest.
- This matters for reverse engineering because citation presence is not equivalent to trustworthiness or merit.
- Competitive analysis should look for self-published claim farms, invented authority pages, or prompt-shaped pages feeding naive readers.

### 8. Brand Positioning in LLMs Is Measurable

Sources:
- `Beyond Rank Tracking: Analyzing Brand Perceptions Through Language Model Association Networks` (2025-02-27)
- `Bias and Prejudice in AI Search` (2025-12-30)

- DEJAN pushes beyond rank tracking toward probing brand associations directly in LLM outputs.
- Useful metrics are not limited to rank; they include adjacency, token confidence, uncertainty, and the kinds of descriptors a model reaches for first.

### 9. AI Search Products Behave Like Tool-Orchestrated Agents

Sources:
- `AI Mode Internals` (2025-05-28)
- `Google's New URL Context Tool` (2025-05-21)

- DEJAN frames Google AI Mode as an orchestrator with tools rather than a single opaque model.
- Search, page fetching, lightweight Python execution, and contextual metadata matter because they change both failure modes and opportunities for reverse engineering.
- Operational rule: diagnose routing, retrieval, fetching, and synthesis as separate layers.

### 10. Browser and Client Code Are Valid Reverse-Engineering Surfaces

Sources:
- `Inside Chrome's Semantic Engine: A Technical Analysis of History Embeddings` (2025-08-21)
- `There's a small army of on-device models coming to Chrome` (2025-06-05)

- DEJAN repeatedly mines browser code and model registries to infer chunking, embedding, and on-device model behavior.
- The History Embeddings analysis is especially useful because it exposes passage-size assumptions and extraction limits that can act as proxies for machine readability.
- Operational rule: inspect browser/client code whenever the web product itself is too opaque.

### 11. DEJAN Turns Reverse Engineering Into Small Purpose-Built Models

Sources:
- `Introducing Grounding Classifier` (2025-04-02)
- `AI Content Detection` (2025-04-17)
- `Our Machine Learning Models`

- DEJAN's playbook is not just "understand the system"; it is "fit a compact model that predicts or scores one narrow behavior."
- Examples include grounding eligibility, AI-content detection, fan-out generation, query quality, link placement, and sentiment.
- Operational rule: once a behavior is visible enough, build a narrow predictor for it.

### 12. Retrieval-First Is a Preferred Design Lens

Source: `I think Google got it wrong with "Generate -> Ground" approach.` (2025-04-17)

- DEJAN argues generate-then-ground introduces a brittle query-generation layer and extra latency.
- Even when a system still uses post-hoc grounding, this lens is useful for explaining why outputs wobble.
- Operational rule: when results look unstable, test whether evidence was present before generation or patched in afterward.

### 13. Legacy Technical SEO Heuristics Still Explain Modern Failures

Sources:
- `Here's Why Nobody Reads Your Content` (2015-06-11)
- `[SEO Test] Tabs and Accordions not OK in Mobile-First` (2018-09-12)
- `I just outranked The White House with this hidden content test.` (2022-04-14)
- `Link inversion, the least known major ranking factor.` (2018-10-10)

- Older DEJAN work repeatedly returns to a few themes: visible content beats buried content, duplicate handling redistributes value, and user behavior mediates what systems learn.
- These are not modern product guarantees, but they are still useful failure-model templates for AI-search debugging.
- Operational rule: when grounded or selected text underperforms, check old-school visibility, canonicalization, and UX/trust issues before assuming a purely AI-native cause.

## Practical Reverse-Engineering Moves

1. Capture the visible prompt and infer the hidden task graph.
2. Compare ranking positions against actual grounded snippets or citations.
3. Measure what percent of a source page appears to survive extraction.
4. Rewrite candidate passages into short, factual, self-contained blocks and retest selection.
5. Test if content still makes sense after reader-mode-style distillation or block extraction.
6. Probe brand/entity prompts to map association strengths, weaknesses, and uncertainty.
7. Separate transient grounding wins from durable brand-bias shifts.
8. Treat schemas, tools, and structured interfaces as inputs to discoverability, not magic guarantees.
9. Inspect browser code, client-side features, or model registries when public UI behavior is too sparse to explain the system.
10. When a behavior becomes measurable, consider a narrow replica model instead of repeatedly doing manual analysis.
11. Before blaming the model, run a legacy SEO pass on visibility, hidden content, duplicate clusters, canonical targets, and trust cues.

## Working Heuristics For Future Tasks

- Front-load the sentence you want selected.
- Avoid burying the answer inside narrative setup.
- Write passages that can stand alone when stripped from page context.
- Expect only part of the page to matter.
- Use multiple prompt variants because fan-out and hidden sub-queries change what gets grounded.
- Keep "ranking" and "selection" as separate dashboards.
- Watch for manipulative content succeeding in AI answers despite weak true authority.
- Distinguish retrieval failures from routing failures and synthesis failures.
- Favor compact task-specific evaluators when the same reverse-engineering question keeps recurring.
- Old technical SEO heuristics still matter because AI systems inherit retrieval, canonicalization, and content-visibility constraints from the classic web stack.

## Sources Used For This Pack

- https://dejan.ai/blog/
- https://dejan.ai/blog/page/2/
- https://dejan.ai/blog/page/3/
- https://dejan.ai/blog/page/4/
- https://dejan.ai/blog/beyond-rank-tracking-analyzing-brand-perceptions-through-language-model-association-networks/
- https://dejan.ai/blog/sr/
- https://dejan.ai/blog/category/seo/

Additional surfaced DEJAN pages used via search or archive snippets:

- `Reverse Prompting: Reconstructing Prompts from AI-Generated Text` (2026-03-18)
- `Rufus - Under the Hood. What Drives Amazon's AI Shopping Assistant?` (2026-03-15)
- `Is Query Length a Reliable Predictor of Search Volume?` (2026-03-12)
- `Search Grounding is Transient` (2026-03-06)
- `SRO & Grounding Snippets` (2026-03-01)
- `What extraction method is Google using to build grounding snippets?` (2026-02-24)
- `Implicit Queries in AI Search` (2026-02-24)
- `AI Search Has a Spam Problem` (2026-02-18)
- `WebMCP` (2026-02-10)
- `Most People Don't Read` (2025-12-30)
- `How big are Google's grounding chunks?` (2025-12-20)
- `Grounding Snippet Extraction Tool` (2025-12-15)
- `How Long Are Web Pages?` (2025-12-14)
- `How GPT Sees the Web` (2025-11-14)
- `In AI SEO #10 is the new #1` (2025-11-09)
- `How much of your content survives the AI Search filter?` (2025-11-08)
- `Browsing vs Content Fetcher` (2025-11-08)
- `AI Search Citation Mining` (2025-09-27)
- `Annotated Page Content (APC)` (2025-09-22)
- `Deconstructing DomDistiller: How Chrome's Reader Mode Algorithm Impacts Technical SEO` (2025-09-22)
- `LLM is a Presentation Layer in AI Search` (2025-09-21)
- `Fan-Out Query Search Volume Prediction Using Deep Learning` (2025-08-30)
- `AI Mode Internals` (2025-05-28)
- `Google's New URL Context Tool` (2025-05-21)
- `I think Google got it wrong with "Generate -> Ground" approach.` (2025-04-17)
- `Introducing Grounding Classifier` (2025-04-02)
- `AI Content Detection` (2025-04-17)
- `Inside Chrome's Semantic Engine: A Technical Analysis of History Embeddings` (2025-08-21)
- `There's a small army of on-device models coming to Chrome` (2025-06-05)
- `Training a Query Fan-Out Model` (2025-06-24)
- `Training Gemma-3-1B Embedding Model with LoRA` (2025-06-28)
- `Search Query Quality Classifier` (2024-08-31)
- `Introducing VecZip: Embedding Compression Algorithm` (2024-12-12)
- `Resource-Efficient Binary Vector Embeddings With Matryoshka Representation Learning` (2024-09-05)
- `Our Machine Learning Models`
- `Here's Why Nobody Reads Your Content` (2015-06-11)
- `[SEO Test] Tabs and Accordions not OK in Mobile-First` (2018-09-12)
- `I just outranked The White House with this hidden content test.` (2022-04-14)
- `User Behaviour Data as a Ranking Signal` (2015-08-11)
- `Link inversion, the least known major ranking factor.` (2018-10-10)
- `SEO Test: Sending Mixed-Signals to Google` (2013-06-12)
- `Anchor Text Proximity Experiment` (2013-04-09)
- `PageRank Split Experiment` (2012-07-26)

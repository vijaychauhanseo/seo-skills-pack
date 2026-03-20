# Memory: DEJAN AI Reverse Engineering Pack

Date: 2026-03-20
Owner: vijaychauhan
Topic: DEJAN AI / Dan Petrovic

## What Was Stored

- A local skill snapshot for DEJAN-style AI SEO and reverse engineering.
- A compact archive map of surfaced DEJAN posts from 2024-08 through 2026-03.
- Core heuristics around grounding, selection rate, primary bias, machine readability, and model-aware content diagnostics.
- A reusable checklist for operational AI-search reverse-engineering tasks, not just DEJAN-branded requests.
- A dedicated reference for DEJAN's model/tool stack and system-internals research patterns.
- A legacy technical SEO reference drawn from older DEJAN work on visibility, CTR, canonicals, duplicate handling, and link context.

## Highest-Signal Takeaways

- Latest surfaced DEJAN post in this research pass: `Reverse Prompting: Reconstructing Prompts from AI-Generated Text` dated 2026-03-18.
- DEJAN's key conceptual move is from rankings to `selection`: what snippet or chunk actually gets chosen into an AI answer.
- `SRO` means Selection Rate Optimization, positioned as the AI-native successor to CTR.
- Grounding is selective and transient. Pages are not read in full, and grounded passages should not be treated as durable model memory.
- On DEJAN's cited-content sample, roughly one third of source-page text survived into AI-cited content.
- `Primary bias` matters: a model's latent relevance perception can influence which grounded candidates get selected before on-page tuning has much effect.
- Reader-mode-style extraction, APC-like structure, and other machine-readable representations are useful proxies for AI visibility readiness.
- AI answers can be manipulated because grounding checks whether a claim exists in a source, not whether the source is honest.
- AI search products should be inspected as orchestrated tool systems, not single models; DEJAN's AI Mode work explicitly exposes tool layers like search, page fetch, time/location context, and Python.
- Chrome/browser internals are useful proxy surfaces; DEJAN's history-embeddings analysis surfaced a 200-word chunk target, 30-passage page cap, 5-word minimum, and 1540-dimensional embeddings.
- DEJAN repeatedly converts reverse-engineered behavior into narrow production models such as grounding classifiers, fan-out models, query-quality gates, and AI-content detectors.
- Older DEJAN technical SEO work still contributes useful priors: visible content usually beats hidden content, canonicals can redirect value in surprising ways, and link/context/behavior effects need their own diagnostic pass.
- Mid-2025 DEJAN posts add a strong AI Mode layer: not-live-web/content-store behavior, `Prepare -> Retrieve -> Signal -> Serve`, executable query fan-out workflows, and the principle that human-friendly content is also AI-friendly content.
- The deeper April-May 2025 sweep adds grounding-eligibility logic, tool-introspection patterns, content-salience ideas, and interpretability frameworks for brand/entity steering.
- The newer archive pass adds separate AI Mode content-store/index notes, synthetic training-data work, KG-to-LLM representation ideas, and an operational internal-linking workflow tool (`ILO`).
- The last worthwhile second-tier DEJAN posts are now folded in too: Gemini schemas, task-specific embedding modes, bucketed volume forecasting, hallucinated-URL recovery, Lens multimodal routing, and MUVERA-adjacent research tracking.

## Default Reverse-Engineering Heuristics

- Compare SERP position against actual grounded snippet selection.
- Rewrite candidate passages into short, factual, self-contained blocks.
- Test hidden fan-out and implicit query variants, not only the visible user prompt.
- Separate short-term grounding wins from slow-moving brand-association or bias shifts.
- Treat rankings, citations, and selection rate as different layers of visibility.

## Local Artifacts

- Skill: `~/.codex/skills/dejan-ai-reverse-engineering/`
- Notes: `~/.codex/skills/dejan-ai-reverse-engineering/references/dejan-ai-notes.md`
- Archive: `~/.codex/skills/dejan-ai-reverse-engineering/references/dejan-ai-archive-2025-2026.md`
- Models/Systems: `~/.codex/skills/dejan-ai-reverse-engineering/references/dejan-models-and-systems.md`
- Legacy SEO: `~/.codex/skills/dejan-ai-reverse-engineering/references/dejan-legacy-technical-seo.md`
- Checklist: `~/.codex/skills/dejan-ai-reverse-engineering/references/reverse-engineering-checklist.md`

## Sources Used

- https://dejan.ai/blog/
- https://dejan.ai/blog/page/2/
- https://dejan.ai/blog/page/3/
- https://dejan.ai/blog/page/4/
- https://dejan.ai/blog/category/ai/
- https://dejan.ai/blog/category/machine-learning/
- https://dejan.ai/blog/beyond-rank-tracking-analyzing-brand-perceptions-through-language-model-association-networks/
- https://dejan.ai/blog/sr/
- https://dejan.ai/blog/category/seo/
- https://dejan.ai/models/
- https://dejanmarketing.com/

Additional surfaced titles used in synthesis:

- `Reverse Prompting: Reconstructing Prompts from AI-Generated Text`
- `Search Grounding is Transient`
- `SRO & Grounding Snippets`
- `What extraction method is Google using to build grounding snippets?`
- `Implicit Queries in AI Search`
- `AI Search Has a Spam Problem`
- `WebMCP`
- `Most People Don't Read`
- `How big are Google's grounding chunks?`
- `Grounding Snippet Extraction Tool`
- `How GPT Sees the Web`
- `In AI SEO #10 is the new #1`
- `How much of your content survives the AI Search filter?`
- `Browsing vs Content Fetcher`
- `Annotated Page Content (APC)`
- `Deconstructing DomDistiller: How Chrome's Reader Mode Algorithm Impacts Technical SEO`
- `Fan-Out Query Search Volume Prediction Using Deep Learning`
- `AI Mode Internals`
- `Google's New URL Context Tool`
- `I think Google got it wrong with "Generate -> Ground" approach.`
- `Inside Chrome's Semantic Engine: A Technical Analysis of History Embeddings`
- `Training a Query Fan-Out Model`
- `Training Gemma-3-1B Embedding Model with LoRA`
- `Introducing Grounding Classifier`
- `AI Content Detection`
- `Search Query Quality Classifier`
- `Introducing VecZip: Embedding Compression Algorithm`
- `Our Machine Learning Models`
- `AI Mode is Not Live Web`
- `AI Mode & Page Indexing`
- `AI Mode Site Search`
- `How Google grounds its LLM, Gemini.`
- `How Google Decides When to Use Gemini Grounding for User Queries`
- `The Inner Workings of GPT's file_search Tool`
- `Live Blog: Hacking Gemini Embeddings`
- `Content Substance Classification`
- `Chrome's New Embedding Model: Smaller, Faster, Same Quality`
- `AI Mode, Content & Search Index`
- `Google's Query Fan-Out System - A Technical Overview`
- `Query Fan-Out Prompt Implementation in Google's Open-Source Agentic Framework`
- `Multi-Step Research Agent`
- `Human Friendly Content is AI Friendly Content`
- `GPT-5 Made SEO Irreplaceable`
- `Prompt Engineer's Guide to Gemini Schemas`
- `Analysis of Gemini Embed Task-Based Dimensionality Deltas`
- `LLM-Based Search Volume Prediction`
- `From Hallucinations to Clicks`
- `Google Lens Modes`
- `Top 10 Most Recent Papers by MUVERA Authors`
- `Advanced Interpretability Techniques for Tracing LLM Activations`
- `Strategic Brand Positioning in LLMs: A Methodological Framework for Prompt Engineering and Model Behavior Analysis`
- `Teaching AI Models to Be Better Search Engines: A New Approach to Training Data`
- `Self-Supervised Quantized Representation for KG-LLM Integration`
- `ILO`
- `Here's Why Nobody Reads Your Content`
- `[SEO Test] Tabs and Accordions not OK in Mobile-First`
- `I just outranked The White House with this hidden content test.`
- `User Behaviour Data as a Ranking Signal`
- `Link inversion, the least known major ranking factor.`
- `SEO Test: Sending Mixed-Signals to Google`
- `Anchor Text Proximity Experiment`
- `PageRank Split Experiment`

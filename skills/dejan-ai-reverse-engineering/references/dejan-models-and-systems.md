---
source: https://dejan.ai
title: DEJAN Models and System Patterns
scraped: 2026-03-20
tags: ai mode, models, systems, orchestration, retrieval, tool use
topic: ai_mode_systems
intent: reverse_engineering, systems, research
role: pinchy, coral, researcher, developer
confidence: high
canonical: true
canonical_group: AI mode systems
use_for: ai_mode, tool_orchestration, cached_content, retrieval_pipeline, system_diagnosis
avoid_for: customer_support, invoice_workflows
---

# DEJAN Models and System Patterns

Snapshot date: 2026-03-20
Use this file when you need the deeper DEJAN pattern: reverse engineer a search system from observable artifacts, then build a compact task-specific model or tool around the finding.

## System-Level Reverse Engineering

### AI Mode Internals

Source: `AI Mode Internals` (2025-05-28)

- DEJAN describes Google AI Mode as Gemini-like orchestration with tools including Google Search, Calculator, Time, Location, and Python.
- The article shows internal `tool_code`-style behavior and environment details, including a Linux runtime and a small Python library set.
- Practical takeaway: inspect AI search products as tool-using orchestrators, not single monolithic models.

### AI Mode Is Not The Live Web

Sources:
- `AI Mode is Not Live Web` (2025-05-29)
- `AI Mode & Page Indexing` (2025-05-30)
- `AI Mode Site Search` (2025-06-04)

- DEJAN's testing suggests AI Mode may rely on a proprietary or cached content store rather than always fetching the live web directly.
- The `AI Mode Site Search` post describes a simplified process as `Prepare -> Retrieve -> Signal -> Serve`, which is useful as a working diagnostic pipeline.
- Practical takeaway: when a page is indexed or visible in normal search but absent from AI Mode, inspect content-store lag, retrieval eligibility, and separate AI Mode preparation layers rather than assuming a generic crawling failure.

### Grounding Is Also A Routing Decision

Sources:
- `How Google Decides When to Use Gemini Grounding for User Queries` (2025-03-29)
- `How Google grounds its LLM, Gemini.` (2025-05-08)
- `Introducing Grounding Classifier` (2025-04-02)

- DEJAN's work shows grounding is not simply "on" or "off"; it is a decision layer based on query characteristics and expected benefit.
- The May 8 post expands the technical view of how Gemini verifies outputs through external grounding, while the classifier post turns that behavior into a replica model.
- Practical takeaway: when debugging AI visibility, separate `grounding eligibility` from `retrieval quality` and from `final snippet selection`.

### URL Context as a New Reading Layer

Source: `Google's New URL Context Tool` (2025-05-21)

- DEJAN highlights a shift from search-only grounding to live page fetching plus deeper page reading.
- Practical takeaway: when a system gains a page-fetch or URL-context tool, machine-readable page structure becomes even more important because the system can inspect pages more directly.

### Generate -> Ground Is Fragile

Source: `I think Google got it wrong with "Generate -> Ground" approach.` (2025-04-17)

- DEJAN argues post-hoc grounding is brittle because the auto-generated query layer can fail and poison retrieval.
- Their preferred direction is retrieval-first generation, where evidence is present before decoding.
- Practical takeaway: if you are reverse engineering a grounded answer stack, test whether retrieval happens before or after drafting because failure modes differ sharply.

### Chrome and Browser Internals Are Useful Proxies

Sources:
- `There's a small army of on-device models coming to Chrome` (2025-06-05)
- `Inside Chrome's Semantic Engine: A Technical Analysis of History Embeddings` (2025-08-21)

- DEJAN mines Chromium and browser-adjacent artifacts to infer how web content may be chunked and embedded.
- History Embeddings findings include a `DocumentChunker`, a default 200-word aggregation target, a maximum of 30 passages per page, a minimum 5-word passage threshold, a 5000 ms extraction delay, and 1540-dimensional vectors stored locally.
- Practical takeaway: browser code can reveal real-world passage boundaries, chunk budgets, and embedding assumptions that are directly relevant to AI visibility work.

### Query Fan-Out Is Both Research Pattern and Product Pattern

Sources:
- `Google's Query Fan-Out System – A Technical Overview` (2025-08-09)
- `Query Fan-Out Prompt Implementation in Google's Open-Source Agentic Framework` (2025-06-04)
- `Multi-Step Research Agent` (2025-06-04)

- DEJAN does not treat query fan-out as just a ranking concept; it models it as an executable agent workflow and a concrete engineering pattern.
- The June and August posts reinforce that hidden fan-out should be thought of as a transparent research pipeline with observable intermediate steps.
- Practical takeaway: when reverse engineering AI search, capture not only the final answer but the sub-query graph and research flow the system is likely following.

### Human-Friendly Content Is Also Model-Friendly

Sources:
- `Human Friendly Content is AI Friendly Content` (2025-07-21)
- `GPT-5 Made SEO Irreplaceable` (2025-08-10)

- DEJAN argues humans and AI systems share an attention bottleneck: both rely on selective processing and benefit from reduced cognitive load.
- The practical implication is that clear, front-loaded, low-friction writing is not a compromise between humans and machines; it helps both.
- Practical takeaway: when trying to improve grounding or selection, start by tightening the sentence structure and reducing extraction friction rather than layering on more complexity.

### Tool And System Prompt Introspection Is A Valid Shortcut

Sources:
- `The Inner Workings of GPT's file_search Tool` (2025-05-27)
- `Live Blog: Hacking Gemini Embeddings` (2025-05-24)

- DEJAN frequently learns from exposed prompts, tool instructions, and embedders rather than waiting for official documentation.
- The file_search post is useful beyond OpenAI itself because it reinforces the habit of treating tool behavior as inspectable infrastructure.
- Practical takeaway: if a system exposes hidden tool instructions, embedding behavior, or retrieval interfaces, treat that as first-class evidence in reverse engineering.

### Schema And Response Surfaces Deserve Reverse Engineering Too

Source: `Prompt Engineer's Guide to Gemini Schemas` (2025-07-02)

- DEJAN treats Gemini response schemas as part of the reverse-engineering surface, not just API plumbing.
- Candidate objects, prompt feedback, safety metadata, and usage fields create structured evidence that can be logged and compared across experiments.
- Practical takeaway: when a platform exposes a formal response schema, instrument the schema directly instead of relying only on rendered output text.

### Internal Linking And Workflow Tooling Matter

Source: `ILO` (2024-10-05)

- DEJAN's ILO app is not just a utility; it shows how query mapping, URL selection, internal linking, and behavior data can be wired into one operational SEO workflow.
- Practical takeaway: reverse engineering should not stop at theory. Once a signal or pattern is understood, turn it into a repeatable workflow or operator tool.

## DEJAN's Model-Building Playbook

### Small, Dedicated Models

Source: `Our Machine Learning Models` page

- DEJAN explicitly says it prefers small, dedicated models trained on high-quality data rather than one giant general model.
- This is a useful operating principle for our own reverse-engineering tasks: isolate one narrow behavior and build a replica, classifier, or evaluator around it.

### Search Query Fan-Out

Sources:
- `Our Machine Learning Models`
- `Training a Query Fan-Out Model` (2025-06-24)
- `Training Gemma-3-1B Embedding Model with LoRA` (2025-06-28)

- The models page says fan-out training ran for 70 hours across 15 million training samples.
- DEJAN describes a pipeline using Gemma 3 1B for feature extraction, vector-space traversal between query and target document, and a multilingual T5 model for query expansion.
- The June 24 article reports 863,307 synthetic training examples for a `qsT5` query suggestion model.
- The August 9 technical overview makes clear that DEJAN sees Google's fan-out as a reconstructable production system, not just a paper concept.
- Practical takeaway: DEJAN frequently starts from an observed Google method, reconstructs the latent process, and then turns it into an SEO-specific production model.

### Universal Search Query Classifier

Source: `Our Machine Learning Models`

- This model is open-set and supports arbitrary label names and descriptions at inference time.
- Structured special tokens include `[QUERY]`, `[LABEL_NAME]`, and `[LABEL_DESCRIPTION]`.
- Practical takeaway: for reverse-engineering tasks involving query classification, prefer flexible label-space designs over fixed taxonomies when the intent system is likely to evolve.

### Grounding Classifier

Source: `Introducing Grounding Classifier` (2025-04-02)

- DEJAN says it collected and analyzed 10,000 prompts with Gemini 2.5 Pro grounding enabled, then trained a replica of Google's internal grounding classifier.
- Practical takeaway: the output of a live product can be used to fit a secondary model that predicts internal routing or eligibility decisions.

### AI Content Detection

Sources:
- `AI Content Detection` (2025-04-17)
- `Our Machine Learning Models`

- DEJAN says its base model `DEJAN-LM` was pre-trained on 10,000,000 sentences from high-quality web content and fine-tuned on a 20,000,000-sentence AI-vs-human dataset.
- The article also adds a heuristic layer based on discriminating word lists and reports boosting GPT-o4-mini combined AI-likelihood from 20.8% to 68.1%.
- Practical takeaway: DEJAN often combines learned models with handcrafted heuristics when the model alone underperforms against new model families.

### Content Substance And Salience Filtering

Sources:
- `Content Substance Classification` (2025-04-23)
- `Dissecting Gemini's Tokenizer and Token Scores` (2025-06-05)

- DEJAN explores whether content can be reduced to more essential, information-dense forms before downstream retrieval or summarisation.
- The tokenizer analysis complements this by showing that tokens themselves carry prior likelihood structure and bias.
- Practical takeaway: not all text carries equal information value. Reverse engineering should ask which parts of a page carry the most salience and which parts are likely ignored as low-substance filler.

### Embedding Modes Change Representation By Task

Sources:
- `Analysis of Gemini Embed Task-Based Dimensionality Deltas` (2025-07-16)
- `Prompt Engineer's Guide to Gemini Schemas` (2025-07-02)

- DEJAN shows that Gemini embeddings are not one fixed semantic space; representation shifts depending on task mode.
- Query-mode and document-mode embeddings should not be assumed interchangeable just because they share a model family.
- Practical takeaway: when testing retrieval or clustering, keep task-mode assumptions explicit and benchmark query/document pairings separately.

### Query Form Quality and Intent

Sources:
- `Search Query Quality Classifier` (2024-08-31)
- `Our Machine Learning Models`
- `Query Intent via Retrieval Augmentation and Model Distillation` (2024-09-05)

- DEJAN says its well-formed-query classifier improved on Google's classifier by about 10% and runs at roughly 80% accuracy in production.
- The practical role is to identify ambiguous queries that deserve query expansion.
- Practical takeaway: lightweight gatekeeper models can make larger pipelines more efficient by deciding when to apply heavier reasoning or expansion.

### Training Data And Knowledge Representation

Sources:
- `Teaching AI Models to Be Better Search Engines: A New Approach to Training Data` (2025-02-13)
- `Self-Supervised Quantized Representation for KG-LLM Integration` (2025-02-06)
- `Query Intent via Retrieval Augmentation and Model Distillation` (2024-09-05)

- DEJAN keeps returning to the same meta-problem: how to create better training signals and compact representations for search tasks without depending entirely on manual labels.
- The training-data article is especially useful because it frames synthetic example generation as a scalable way to teach search behavior.
- The KG-LLM integration note matters because it points to structured knowledge compression as another way to reduce hallucinations and improve factual recall.
- Practical takeaway: when we need to replicate a behavior, think about the representation and training data pipeline, not just the model architecture.

### Directional Forecasts Beat Faux Precision

Source: `LLM-Based Search Volume Prediction` (2025-05-19)

- DEJAN tested Gemini against real Search Console-style data and found that coarse ranking into buckets is more realistic than exact numeric prediction.
- This makes LLMs more useful for opportunity tiering than for spreadsheet-grade volume forecasting.
- Practical takeaway: use model-based volume estimates for rough prioritization only.

### Hallucinated URLs Are An Operational SEO Surface

Source: `From Hallucinations to Clicks` (2025-06-02)

- DEJAN treats hallucinated URLs as measurable user and system events rather than dismissing them as irrelevant noise.
- The recommended posture is cautious: help users recover from bad URLs, but avoid naive one-to-one redirect automation that can create bad matches.
- Practical takeaway: if AI systems invent your URLs, solve it as a retrieval and recovery problem, not only a content problem.

### Multimodal Search Routing Deserves Attention

Source: `Google Lens Modes` (2025-05-08)

- DEJAN maps `lns_mode` values to text-only, unimodal, and multimodal search behavior and connects them to AI Mode evolution.
- Practical takeaway: multimodal requests may route through different systems and carry different context payloads, so reverse engineering should track request mode explicitly.

### LinkBERT and Link/Spam Signals

Source: `Our Machine Learning Models`

- LinkBERT is positioned as a model for predicting natural link placement and likely anchor regions inside text.
- The models page also exposes a link spam algorithm focused on identifying risky money-link patterns.
- Practical takeaway: DEJAN treats link placement and spam detection as learnable behavioral prediction problems, not just rule-based audits.

### Embedding Compression and Efficiency

Sources:
- `Vector Embedding Optimization` (2025-06-06)
- `Introducing VecZip: Embedding Compression Algorithm` (2024-12-12)
- `Resource-Efficient Binary Vector Embeddings With Matryoshka Representation Learning` (2024-09-05)

- DEJAN repeatedly works on reducing embedding cost while preserving or improving utility.
- VecZip is described as a compression method with about 50:1 reduction.
- The 2025 evaluation compares regular, binary, MRL, and combined methods and reports that MRL improved accuracy on the hardest sentence-pair cases in their small benchmark.
- Practical takeaway: compression or dimensionality reduction is not only about cost; DEJAN treats it as a possible quality lever for downstream SEO and retrieval workflows.

### Upstream Research Maps Help Predict Google's Next Moves

Source: `Top 10 Most Recent Papers by MUVERA Authors` (2025-06-30)

- DEJAN tracks author clusters and adjacent papers, not just product releases, to infer where Google retrieval and vector systems may go next.
- Practical takeaway: follow the research neighborhood around production systems if you want earlier clues than public product UI changes.

### Interpretability As Brand And Retrieval Research

Sources:
- `Advanced Interpretability Techniques for Tracing LLM Activations` (2025-03-31)
- `Cross-Model Circuit Analysis: Gemini vs. Gemma Comparison Framework` (2025-03-29)
- `Neural Circuit Analysis Framework for Brand Mention Optimization` (2025-03-29)
- `Strategic Brand Positioning in LLMs: A Methodological Framework for Prompt Engineering and Model Behavior Analysis` (2025-03-29)

- DEJAN treats mechanistic interpretability as practical SEO research infrastructure, especially for brand mention optimization and model steering.
- This cluster matters because it moves beyond black-box prompting into circuit-level or activation-level inspection.
- Practical takeaway: when the task is deeper than rankings or citations, DEJAN's method is to inspect internal behavior where possible and connect that to brand/entity outcomes.

## Reusable Patterns For Our Squad

Use these patterns when we do our own reverse-engineering work:

1. Extract observable artifacts from the live product or public code.
2. Build a narrow classifier, scorer, or replica model around the observed behavior.
3. Measure routing, selection, or eligibility separately from ranking.
4. Keep heuristics if they materially patch model blind spots.
5. Prefer small production tools over vague theory when the goal is repeatable analysis.

## Sources

- https://dejan.ai/models/
- https://dejan.ai/blog/ai-mode-internals/
- https://dejan.ai/blog/ai-mode-is-not-live-web/
- https://dejan.ai/blog/ai-mode-page-indexing/
- https://dejan.ai/blog/ai-mode-site-search/
- https://dejan.ai/blog/how-google-decides-when-to-use-gemini-grounding-for-user-queries/
- https://dejan.ai/blog/how-google-grounds-its-llm-gemini/
- https://dejan.ai/blog/googles-new-url-context-tool/
- https://dejan.ai/blog/generate-then-ground/
- https://dejan.ai/blog/the-inner-workings-of-gpts-file_search-tool/
- https://dejan.ai/blog/live-blog-hacking-gemini-embeddings/
- https://dejan.ai/blog/theres-a-small-army-of-on-device-models-coming-to-chrome/
- https://dejan.ai/blog/inside-chromes-semantic-engine-a-technical-analysis-of-history-embeddings/
- https://dejan.ai/blog/googles-query-fan-out-system-a-technical-overview/
- https://dejan.ai/blog/query-fan-out-prompt-implementation-in-googles-open-source-agentic-framework/
- https://dejan.ai/blog/multi-step-research-agent/
- https://dejan.ai/blog/human-friendly-content-is-ai-friendly-content/
- https://dejan.ai/blog/gpt-5-made-seo-irreplaceable/
- https://dejan.ai/blog/prompt-engineers-guide-to-gemini-schemas/
- https://dejan.ai/blog/training-a-query-fan-out-model/
- https://dejan.ai/blog/analysis-of-gemini-embed-task-based-dimensionality-deltas/
- https://dejan.ai/blog/gemma-embed/
- https://dejan.ai/blog/grounding-classifier/
- https://dejan.ai/blog/ai-content-detection/
- https://dejan.ai/blog/content-substance-classification/
- https://dejan.ai/blog/dissecting-geminis-tokenizer-and-token-scores/
- https://dejan.ai/blog/ilo/
- https://dejan.ai/blog/llm-search-volume/
- https://dejan.ai/blog/from-hallucinations-to-clicks/
- https://dejan.ai/blog/google-lens-modes/
- https://dejan.ai/blog/top-10-most-recent-papers-by-muvera-authors/
- https://dejan.ai/blog/search-query-quality-classifier/
- https://dejan.ai/blog/teaching-ai-models-to-be-better-search-engines-a-new-approach-to-training-data/
- https://dejan.ai/blog/self-supervised-quantized-representation-for-kg-llm-integration/
- https://dejan.ai/blog/query-intent-via-retrieval-augmentation-and-model-distillation/
- https://dejan.ai/blog/vector-embedding-optimization/
- https://dejan.ai/blog/introducing-veczip-embedding-compression-algorithm/
- https://dejan.ai/blog/resource-efficient-binary-vector-embeddings-with-matryoshka-representation-learning/
- https://dejan.ai/blog/advanced-interpretability-techniques-for-tracing-llm-activations/
- https://dejan.ai/blog/cross-model-circuit-analysis-gemini-vs-gemma-comparison-framework/
- https://dejan.ai/blog/neural-circuit-analysis-framework-for-brand-mention-optimization/
- https://dejan.ai/blog/strategic-brand-positioning-in-llms-a-methodological-framework-for-prompt-engineering-and-model-behavior-analysis/

---
source: https://dejan.ai/blog/
title: Live Knowledge Snapshot - DEJAN / Dan Petrovic
scraped: 2026-03-20
tags: live_feed, phase1_ingest, dejan, dejan, practitioner, reverse-engineering, grounding
topic: ai_reverse_engineering
intent: research, monitoring, source_selection, ai_selection
role: researcher, seo, pinchy
confidence: high
canonical: false
canonical_group: Live knowledge snapshots
use_for: freshness, source_monitoring, article_discovery
avoid_for: final_strategy_without_durable_notes
---

# Live Knowledge Snapshot - DEJAN / Dan Petrovic

Homepage: https://dejan.ai/blog/
Kind: practitioner
Strength: AI-search reverse engineering, grounding, AI Mode, machine readability
Feed source: https://dejan.ai/blog/feed/
Feed title: DEJAN
Latest published date: 2026-03-20
New items since last run: 0
Snapshot path: /Users/vijaychauhan/squad_memory/ingest/reputable/raw/dejan/2026-03-20/20260320T125522Z-blog-feed-c3093c3a5c.xml

## Latest Items
- 2026-03-20 | [Fanout Query Analysis](https://dejan.ai/blog/fanout-query-analysis/)
  When AI models like Gemini, GPT or Nova answer a question using web search, they don’t just run your query as-is. They generate their own internal search queries, or fanout queries. A single user prompt can trigger multiple fanout queries as the model breaks down the question, ex
- 2026-03-18 | [Reverse Prompting: Reconstructing Prompts from AI-Generated Text](https://dejan.ai/blog/reverse-prompting/)
  We fine-tuned Google’s Gemma 3 (270M) to reverse the typical LLM workflow: given an AI-generated response, the model reconstructs the most likely prompt that produced it. We generated 100,000 synthetic prompt-response pairs using Gemini 2.5 Flash, trained for a single epoch on a 
- 2026-03-15 | [Rufus – Under the Hood. What Drives Amazon’s AI Shopping Assistant?](https://dejan.ai/blog/rufus/)
  What’s Publicly Known About the Pipeline, Backend, and Response Anatomy. Rufus is not “one model that magically answers.” Public Amazon/AWS descriptions point to a multi-component system: Speculative schema: Pipeline: request → answer Step A — Input + context assembly Public desc
- 2026-03-12 | [Is Query Length a Reliable Predictor of Search Volume?](https://dejan.ai/blog/query-length-vs-volume/)
  The answer is no. There’s a widely held intuition in SEO and ecommerce search: short queries have high volume, long queries have low volume. “laptop” gets millions of searches. “left handed ergonomic vertical mouse wireless” does not. It feels obvious. But is query length actuall
- 2026-03-06 | [Search Grounding is Transient](https://dejan.ai/blog/search-grounding-is-transient/)
  There is a fundamental misconception about how Google’s AI search and Gemini chatbot process retrieved web content. It is widely understood that these systems use Retrieval-Augmented Generation (RAG) to search the web, pull snippets from pages, and ground their answers in factual
- 2026-03-01 | [SRO & Grounding Snippets](https://dejan.ai/blog/sro-grounding-snippets/)
  Source: dejan.ai/blog/category/ai-seo/sro/Author: Dan Petrovic, DEJAN AIPosts analyzed: 5 (Sep 2025 – Feb 2026) What is SRO? SRO — Selection Rate Optimization — is a new discipline coined by DEJAN that addresses visibility in AI-powered search (Google AI Mode, Gemini Chat, AI Ove
- 2026-02-24 | [What extraction method is Google using to build grounding snippets?](https://dejan.ai/blog/what-extraction-method-is-google-using-to-build-grounding-snippets/)
  I’ve been reverse-engineering Google’s Gemini grounding pipeline (AI Mode, Gemini Chat…etc) by examining the raw groundingSupports and groundingChunks returned by the API. Specifically, I’m interested in the snippet construction step, the part where, given a query and a retrieved
- 2026-02-24 | [Implicit Queries in AI Search](https://dejan.ai/blog/implicit-queries-in-ai-search/)
  Back in 2015 I wrote about Google’s reliance of user behaviours signals for ranking purposes. In that article I already covered their use of implicit signals, but now there’s an update! While investigating Google’s grounding pipeline (the system that feeds web content to Gemini b

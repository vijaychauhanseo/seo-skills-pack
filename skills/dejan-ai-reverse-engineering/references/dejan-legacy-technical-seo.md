# DEJAN Legacy Technical SEO Foundations

Snapshot date: 2026-03-20
Primary legacy source domain: `https://dejanmarketing.com`

Use this file for older DEJAN technical SEO work that still helps with reverse engineering, diagnostics, and content-visibility decisions. Treat these as durable heuristics and historical experiments, not guaranteed current Google behavior.

## How To Use Legacy Material

- Use old experiments to generate hypotheses and tests, not to assert timeless rules.
- Favor ideas that still map cleanly to modern systems: visibility, extractability, behavior signals, canonicalization, link context, and trust cues.
- Keep explicit dates on every legacy claim so we do not accidentally treat a 2011 or 2018 result as a current product guarantee.

## Enduring Legacy Themes

### 1. Important Content Should Usually Be Visible by Default

Sources:
- `Here's Why Nobody Reads Your Content` (2015-06-11)
- `[SEO Test] Tabs and Accordions not OK in Mobile-First` (2018-09-12)
- `I just outranked The White House with this hidden content test.` (2022-04-14)

- In 2015, DEJAN's reading-behavior research found only about one in five people read web content word for word; most users scan and sample.
- The same piece introduced `hypotext` as a UX-friendly way to reveal content on demand, but it also exposed the tension between usability and search visibility.
- In the 2018 mobile-first test, DEJAN reported that hidden tab/accordion content still underperformed visible content. The practical advice was blunt: if it matters, do not hide it.
- In the 2022 White House test, DEJAN said a visible-copy page outranked a hidden-copy page, and rankings dropped after the content was hidden.
- Practical takeaway: if a sentence matters for ranking, snippet extraction, or grounding, visible default placement is usually safer than burying it behind interaction.

### 2. Behavior and CTR Are Part of the Search-System Reality

Sources:
- `The impact of rankings on Google SERP CTR in 2011` (2011-09-26)
- `User Behaviour Data as a Ranking Signal` (2015-08-11)
- `How I recorded user behaviour on my competitor's websites` (2018-08-21)

- DEJAN spent years treating clicks, sessions, and browsing behavior as observable and modelable parts of ranking systems.
- The 2011 CTR study is old, but it still reinforces a useful diagnostic habit: ranking position and user click propensity are related, but not identical.
- The 2015 ranking-signal article is important because it frames user behavior as part of a search engine's evaluation substrate, even if not every measured behavior is used directly.
- The 2018 competitor behavior experiment is more a cautionary security/privacy story than a tactic, but it reinforces how much user trust and page interaction can be observed when systems permit it.
- Practical takeaway: separate rank from attractiveness and expected click behavior; both can shape what the system learns over time.

### 3. Canonicalization and Duplicate Handling Can Move Value in Non-Obvious Ways

Sources:
- `Link inversion, the least known major ranking factor.` (2018-10-10)
- `SEO Test: Sending Mixed-Signals to Google` (2013-06-12)

- `Link inversion` argues that if multiple versions of the same document exist, Google can consolidate signals toward the strongest canonical version.
- The 2013 mixed-signals test explored what happens when `noindex` and `canonical` are combined in conflicting ways; the core lesson is that contradictory directives produce unstable outcomes.
- Practical takeaway: when reverse engineering a visibility loss, inspect duplicate clusters, canonical targets, and contradictory indexation signals before blaming content quality alone.

### 4. Link Context Matters More Than Simplistic Anchor Dogma

Sources:
- `Anchor Text Proximity Experiment` (2013-04-09)
- `PageRank Split Experiment` (2012-07-26)

- DEJAN's anchor proximity test reported a surprising result: an image link with exact-match ALT text won over plain exact-match anchor text in that setup.
- The main enduring value is not the specific winner; it is the reminder that link semantics include surrounding context, presentation format, and interpretation layers.
- The PageRank split work belongs in the same family of thought: internal/external link structure should be tested as a distribution problem rather than reduced to one-line folklore.
- Practical takeaway: when reverse engineering link effects, inspect placement, surrounding text, destination relationships, and page-level distribution instead of only anchor words.

### 5. Trust, Credibility, and UX Signals Affect Real Outcomes

Sources:
- `Here's Why Nobody Reads Your Content` (2015-06-11)
- `How I recorded user behaviour on my competitor's websites` (2018-08-21)

- DEJAN repeatedly notes that people skim for trust cues like testimonials, pricing, case studies, staff information, and visible signs of credibility.
- Even when not formal ranking factors, these cues affect behavior, and behavior can change downstream performance.
- Practical takeaway: reverse engineering search performance should include trust-signal layout and UX inspection, not just keyword or crawl analysis.

## How Legacy DEJAN Connects To Modern AI Search

- Hidden-content caution from 2015-2022 maps naturally to modern grounding and snippet-selection concerns: if a sentence is buried, it is harder to select.
- CTR and behavior framing maps to `selection rate` thinking: both ask what gets chosen, not just what is available.
- Canonicalization and link inversion still matter because retrieval systems need a preferred version of a document before any LLM layer can use it.
- Link-context experiments map forward into passage extraction and embedding systems, where local context can outweigh simplistic token matching.

## Legacy Heuristics Worth Keeping

- If it is important, avoid hiding it by default.
- Diagnose visibility, interaction, and trust as separate layers.
- Check duplicates and canonicals before assuming a ranking-quality problem.
- Treat links as contextual signals, not isolated anchor strings.
- Use old DEJAN experiments to generate tests, not dogma.

## Sources

- https://dejanmarketing.com/web-content/
- https://dejanmarketing.com/mobile-first-test/
- https://dejanmarketing.com/white-house/
- https://dejanmarketing.com/user-behaviour/
- https://dejanmarketing.com/link-inversion/
- https://dejanmarketing.com/noindex-competitors/
- https://dejanmarketing.com/anchor-text-proximity-experiment/
- https://dejanmarketing.com/pagerank-split-experiment/
- https://dejanmarketing.com/impact-of-rankings-on-ctr/
- https://dejanmarketing.com/competitor-hack/

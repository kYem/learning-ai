# Learning Path: AI Application Engineer / LLM Engineer

**Timeline:** 2-4 weeks focused study, then start applying
**Your skill match today:** ~60%
**London salary range:** £80-130K (senior), higher at top-tier companies
**Demand trend:** Explosive — growing 300% faster than traditional software engineering

---

## Why This Role Fits You

An AI Application Engineer builds products on top of foundation models. RAG systems, AI agents, tool-calling architectures, evaluation pipelines, guardrails, and the APIs that expose all of this to users and other systems.

This is the role where your backend engineering, API design, and TypeScript skills are most directly valuable. An analysis of 1,000+ AI engineer job descriptions in 2026 found that Python appears in 82.5% of listings — but TypeScript appears in 23.4%, making it the second most requested language. Many AI application layers are built in TypeScript.

The key insight from the job market research: "For most AI engineer roles, integrating and operating models matters more than training them from scratch." That's your lane.

**The staff-engineer angle.** You are not going to out-math a 22-year-old researcher, and you don't need to. The market is full of people who can wire up a LangChain demo. It is starved for people who know how agents fail in production: unbounded tool loops, prompt injection through retrieved content, cost runaways, silent regressions when a model updates. That gap is your competitive advantage. Every phase below should leave you with a credible opinion on *how things break and how you'd stop them*.

**What you already have that's directly transferable:**
- Backend API design and implementation (REST, GraphQL — this is the core delivery mechanism)
- TypeScript fluency (LangChain.js, Vercel AI SDK, and many AI app frameworks are TypeScript)
- Production systems experience (reliability, monitoring, error handling)
- Database knowledge (you'll extend this to vector databases)
- Cloud deployment (AWS Lambda, serverless — AI apps often use these)
- Testing discipline (AI evaluation is testing for non-deterministic systems)
- Product sense from tech lead experience (understanding user needs, scoping features)

---

## Phase 1: LLM Fundamentals & API Integration (Week 1)

**Goal:** Understand how LLMs work well enough to build reliable applications on top of them. You don't need to train models — you need to use them effectively.

### What to learn:

**How LLMs Work (application-level understanding):**
- Tokens, context windows, temperature, top-p — what these parameters actually control
- System prompts, few-shot prompting, chain-of-thought — the techniques that shape model behaviour
- Streaming responses — how to build responsive UIs on top of slow model generation
- Function calling / tool use — how models invoke external tools (APIs, databases, code execution)
- Cost and latency — understanding token pricing, when to use small vs large models, caching strategies

**Hands-on with LLM APIs:**
- Sign up for OpenAI and Anthropic APIs. Build a simple chat application in TypeScript.
- Implement streaming responses. Handle errors gracefully (rate limits, context length exceeded, content filtering).
- Implement function calling — give the model a "tool" (e.g., a weather API) and have it decide when to call it.
- Use the Vercel AI SDK (TypeScript-native, excellent DX) — this is increasingly the standard for TypeScript AI apps.

### Resources:
- **Anthropic — "Building Effective Agents"** ([anthropic.com/engineering/building-effective-agents](https://www.anthropic.com/engineering/building-effective-agents)) — The canonical patterns: prompt chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer. Read this first. Internalize the vocabulary.
- **Lilian Weng — "LLM Powered Autonomous Agents"** ([lilianweng.github.io/posts/2023-06-23-agent](https://lilianweng.github.io/posts/2023-06-23-agent/)) — Still the best single overview of the agent design space.
- **The ReAct paper** ([arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)) — Short, foundational. Reason → act → observe.
- **Anthropic documentation** ([docs.anthropic.com](https://docs.anthropic.com)) — Excellent guides on prompt engineering, tool use, and the Messages API. You already use Claude Code, so this is natural.
- **OpenAI Cookbook** ([github.com/openai/openai-cookbook](https://github.com/openai/openai-cookbook)) — Practical examples.
- **Vercel AI SDK docs** ([sdk.vercel.ai](https://sdk.vercel.ai)) — TypeScript-first AI application framework.
- **DeepLearning.AI — "ChatGPT Prompt Engineering for Developers"** — Short course, useful for structured prompting techniques.

### You're done when:
You can build a TypeScript application that streams LLM responses, handles tool calling, manages conversation history, and gracefully handles API errors and rate limits. This should feel like a natural extension of your existing API integration skills.

---

## Phase 2: RAG — Retrieval-Augmented Generation (Week 2)

**Goal:** Master the most in-demand AI application pattern. RAG appears in the majority of AI engineer job descriptions in 2026.

### What to learn:

**Core RAG Architecture:**
1. **Document ingestion:** Load documents (PDF, HTML, markdown), split into chunks
2. **Embedding:** Convert text chunks into vector representations using embedding models
3. **Vector storage:** Store embeddings in a vector database for similarity search
4. **Retrieval:** When a user asks a question, embed their query, find the most similar chunks
5. **Generation:** Pass retrieved chunks + user question to an LLM to generate a grounded answer

**Chunking Strategies:**
- Fixed-size chunking (simple, often good enough)
- Semantic chunking (split on meaning boundaries)
- Recursive character splitting (LangChain's default)
- Why chunk size matters: too small = missing context, too large = diluting relevance

**Embedding Models:**
- OpenAI text-embedding-3-small/large
- Open-source alternatives: sentence-transformers, Nomic
- Dimensionality, cosine similarity, when to normalise

**Vector Databases (pick one to go deep on):**
- **Pinecone** — Managed, easiest to start, widely used. Good TypeScript SDK.
- **Weaviate** — Open-source, more features (hybrid search, filtering)
- **Chroma** — Lightweight, great for prototyping
- **pgvector** — PostgreSQL extension. If you already know Postgres, this is the fastest path and impresses interviewers because it shows you don't reach for new infra when existing tools work.

**Advanced RAG Techniques:**
- Hybrid search: combine vector similarity with keyword (BM25) search
- Re-ranking: use a cross-encoder or [Cohere Rerank](https://cohere.com/rerank) to re-score retrieved documents
- Query transformation: rewrite user queries for better retrieval
- Contextual compression: summarise retrieved chunks before passing to LLM
- Metadata filtering: filter by date, source, category before vector search

**Knowledge Graphs / GraphRAG:**

This is a real differentiator vs. people who only know vector RAG. JDs that call out "RAG/GraphRAG/knowledge graph" specifically (OKX, Bloomberg, several enterprise platform roles) want someone who can argue *when* a graph beats pure vector retrieval — and when it doesn't.

- Read [Microsoft's GraphRAG paper](https://arxiv.org/abs/2404.16130) and skim the [GraphRAG repo](https://github.com/microsoft/graphrag).
- Read Neo4j's [GraphRAG Manifesto](https://neo4j.com/blog/graphrag-manifesto/) for the practitioner view.
- Build a small knowledge graph from your corpus ([Neo4j AuraDB free tier](https://neo4j.com/cloud/aura-free/) or even SQLite with a graph schema) and run the same eval set against both your vector RAG and your graph-backed retrieval. Where does graph win? (Multi-hop reasoning, "show me everything connected to X.") Where does it lose? (Cost, ingestion complexity, simple semantic lookup.)

### Hands-on project:

**Build a "Chat with your docs" system in TypeScript:**
1. Ingest a set of documents (e.g., your Learning-AI folder, or a set of technical docs)
2. Chunk and embed them using OpenAI embeddings
3. Store in pgvector (leverages your Postgres knowledge) or Pinecone
4. Build an API endpoint: user asks a question → retrieve relevant chunks → LLM generates answer with citations
5. Add streaming, error handling, and basic evaluation (does the answer actually use the retrieved context?)

This project alone makes you competitive for AI application engineer roles.

### Resources:
- **LangChain.js documentation** (js.langchain.com) — The most popular framework. Has TypeScript-first support.
- **LlamaIndex TypeScript** (ts.llamaindex.ai) — Alternative to LangChain, more focused on RAG specifically.
- **Pinecone learning centre** — Excellent RAG tutorials.
- **DeepLearning.AI — "Building and Evaluating Advanced RAG Applications"** — Short course.

### You're done when:
You can build a RAG system end-to-end, explain the trade-offs between chunking strategies, and discuss when RAG is the right pattern vs fine-tuning vs just using a large context window.

---

## Phase 3: AI Agents & Production Patterns (Week 3)

**Goal:** Learn the patterns that separate toy demos from production AI applications.

### AI Agents:

**What agents are:**
An LLM that can decide what actions to take, execute them, observe the results, and decide what to do next. The core loop: Think → Act → Observe → Repeat.

**What to learn:**
- **Tool-calling agents:** LLM decides which tools to call based on user intent. Tools can be APIs, database queries, code execution, web search.
- **Multi-step reasoning:** Agent breaks a complex task into steps and executes them sequentially.
- **Planning patterns:** ReAct (Reasoning + Acting), Plan-and-Execute, Tree of Thought.
- **Agent frameworks:** LangChain Agents, LangGraph (for stateful multi-step workflows), CrewAI (multi-agent), Anthropic's tool use patterns.
- **When NOT to use agents:** Agents are unreliable for critical paths. Use deterministic workflows with LLM-powered decision points instead.

### Production AI Patterns:

**Evaluation & Testing (critical for production):**
- LLM-as-judge: use a strong model to evaluate a weaker model's outputs
- Reference-based evaluation: compare against gold-standard answers
- Metrics: faithfulness (does the answer match the sources?), relevance (is the answer on-topic?), harmfulness (safety checks)
- Regression testing: does a prompt change break existing good behaviour?
- Tools: Ragas, DeepEval, Braintrust, custom eval frameworks

**Guardrails & Safety:**
- Input validation: detect prompt injection, off-topic requests, PII
- Output validation: check for hallucinations, harmful content, format compliance
- Content filtering layers before and after the LLM
- Tools: Guardrails AI, NeMo Guardrails, custom regex/classifier layers
- Read [OWASP's LLM Top 10](https://genai.owasp.org/llm-top-10/) first — it tells you what your guardrails actually need to catch.

**Runtime Governance (the part nobody's done yet):**

OKX-style platform JDs explicitly list four governance pillars: *execution isolation, permissions, auditability, cost controls*. Almost nobody on the market has hands-on experience with all four. Build one of each:

- **Isolation:** run one of your tools in a Docker sandbox (or [gVisor](https://gvisor.dev/) / [Firecracker](https://firecracker-microvm.github.io/) if feeling ambitious). The tool should not be able to read your home directory.
- **Permissions:** implement [OAuth-style scopes](https://datatracker.ietf.org/doc/html/rfc6749#section-3.3) for tool access. The agent gets a capability token; the token constrains what it can do. Revocable, auditable.
- **Auditability:** structured log of every tool call, every model call, every routing decision. Queryable. You should be able to reconstruct any agent run after the fact.
- **Cost controls:** per-user and per-session token budgets. Hard kill when exceeded. Cost attribution per tenant for multi-tenant systems.

**Cost Optimisation:**
- Prompt caching (Anthropic supports this natively)
- Semantic caching: if a similar question was asked recently, return the cached answer
- Model routing: use a small/cheap model for simple queries, large/expensive model for complex ones
- Token counting and budget management per user/tenant

**Observability:**
- Trace every LLM call: input tokens, output tokens, latency, model version, cost
- Tools: [LangSmith](https://www.langchain.com/langsmith), Helicone, [Langfuse](https://langfuse.com) (open-source), [Braintrust](https://www.braintrust.dev/)
- Use [OpenTelemetry's GenAI semantic conventions](https://github.com/open-telemetry/semantic-conventions/blob/main/docs/gen-ai/gen-ai-spans.md) for spans (they're stabilizing) so your traces are portable across vendors.
- What to monitor: latency p50/p95/p99, token usage, error rates, evaluation scores over time, cost per request

### Hands-on project:

**Extend your RAG system into a production-grade AI application:**
1. Add an evaluation pipeline: automatically test your RAG system against a set of questions with known answers
2. Add observability: log every LLM call with Langfuse (open-source, self-hostable)
3. Add guardrails: input validation (block prompt injection attempts), output validation (check answer is grounded in retrieved context)
4. Add cost tracking: log token usage per request, calculate cost
5. Build a simple agent: give the LLM access to your RAG system + a web search tool + a calculator, let it decide which to use

### You're done when:
You can build an AI application with RAG, tool use, evaluation, guardrails, and observability. You understand the trade-offs between agentic and deterministic architectures.

---

## Phase 4: Interview Preparation (Week 4)

### Your Narrative

> "I've spent 15 years making production systems reliable — APIs at scale, CI/CD, monitoring, team leadership. I've now spent the last couple of months building agents and RAG systems, and I have strong opinions about how they fail: unbounded tool loops, prompt injection through retrieved content, cost runaways, silent regressions when a model updates. Here's an architecture doc for how I'd build your platform to handle those, and here's the small sandbox I built to prove the isolation model works."

No one walking in off the street has that specific combination. That's the job.

### Technical Interview Topics:

1. **"Design a RAG system for [domain]."** Cover: document ingestion → chunking strategy → embedding model selection → vector DB → retrieval → re-ranking → generation → evaluation. Discuss trade-offs at every stage.

2. **"How would you evaluate an LLM application?"** Cover: automated evals (LLM-as-judge, reference-based), human eval, regression testing, A/B testing, and why traditional software testing doesn't work for non-deterministic systems.

3. **"Design a customer support AI agent."** Cover: intent detection → tool selection (knowledge base, order lookup, escalation) → conversation state management → guardrails → fallback to human. Discuss reliability and failure modes.

4. **"How do you prevent hallucinations?"** Cover: RAG (ground in sources), citation verification, confidence scoring, retrieval quality checks, output validation, and the honest answer that you can reduce but not eliminate hallucinations.

5. **"How would you handle prompt injection?"** Cover: input sanitisation, instruction hierarchy, output validation, monitoring for anomalous behaviour. This is where your security-conscious backend mindset shines.

### Portfolio Projects (have these on GitHub):

1. **Production RAG System** — TypeScript, pgvector or Pinecone, streaming, citations, evaluation suite. Well-tested, well-documented. This is your headline project. Bonus: a GraphRAG variant of the same eval set, with a writeup of when each wins.

2. **AI Agent with Tool Calling** — An agent that can search the web, query a database, and do calculations. Show the ReAct loop, error handling, how you prevent infinite loops, and a sandbox that constrains what tools can actually do.

3. **LLM Evaluation Framework** — A reusable framework for testing LLM outputs: faithfulness, relevance, safety. Show how you'd run this in CI to catch regressions.

4. **Architecture ADR (your interview leave-behind)** — A 6–10 page doc titled something like *"How I would architect [Company]'s internal AI engineering platform."* Cover: model routing & fallback, caching layers (prompt, embedding, tool-response), multi-tenant isolation & cost attribution, the four governance pillars from Phase 3, deployment/rollback for prompts (prompts are code; treat them like code), and what you'd page oncall on. When the interviewer asks "how would you approach this?", you hand them the doc. This is what tips a senior offer into a staff offer.

### Companies to Target (London):

Any company building AI features into their product. Revolut, Monzo, Deliveroo, Wise, GoCardless, Paddle (all have AI application teams). Also: AI-native startups, consultancies (EY, McKinsey, BCG all hiring LLM engineers), and the big tech companies' London offices.

---

## Key Tools Summary

| Category | Tools | Your Familiarity |
|---|---|---|
| Language | TypeScript, Python | **Already know TS**, learn Python basics |
| LLM APIs | OpenAI, Anthropic, Vercel AI SDK | **Learn** (fast — it's API integration) |
| RAG frameworks | LangChain.js, LlamaIndex TS | **Learn** |
| Vector databases | pgvector, Pinecone, Weaviate | **Learn** (pgvector builds on Postgres knowledge) |
| Evaluation | Ragas, DeepEval, Braintrust, Langfuse | **Learn** |
| Observability | Langfuse, LangSmith, Helicone | **Learn** (concepts already known) |
| Deployment | Vercel, AWS Lambda, Docker, K8s | **Already know** |
| CI/CD | GitHub Actions | **Already know** |

Again, notice the pattern: you're learning new tools within familiar concepts (API integration, databases, observability, deployment).

---

## Realistic Timeline

| Week | Focus | Hours |
|---|---|---|
| 1 | LLM APIs + function calling in TypeScript | 12 |
| 2 | RAG system build (embedding, vector DB, retrieval) | 15 |
| 3 | Agents, evaluation, guardrails, observability | 15 |
| 4 | Portfolio polish + interview prep | 10 |
| **Total** | | **~52 hours** |

API costs: ~£10-20 total (OpenAI/Anthropic APIs for development). No GPU rental needed.

---

## Concepts You Will Deliberately Not Learn

Interesting but won't change an interview outcome for *this* role. Don't get sidetracked:

- Training or fine-tuning from scratch (unless a specific role asks). The market wants integrators, not trainers.
- The math of attention, backprop, etc. Know it exists; don't try to compete on it.
- Bleeding-edge agent frameworks that churn weekly (AutoGen, CrewAI variants, etc.) — know they exist, don't rebuild a portfolio in them.
- Vector-DB benchmarking wars. pgvector is fine until it isn't.
- Building your own LLM serving stack. That's the **ML Platform Engineer** path next door — different role.

---

## Why This Path Is Faster

Unlike the nScale role or even the ML Platform Engineer role, this path requires almost no ML theory. You're not training models, optimising GPU kernels, or working with PyTorch. You're using models through APIs and building reliable systems around them — which is exactly what you've been doing with databases, external services, and third-party APIs for your entire career. The concepts are new, but the engineering patterns are familiar.

The TypeScript angle is a genuine differentiator. Most AI engineers come from Python/ML backgrounds and write mediocre TypeScript. You'd come from the opposite direction — strong production TypeScript with AI application knowledge layered on top. Companies building AI features into existing products (which is most companies) need this combination desperately.

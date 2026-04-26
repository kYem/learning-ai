# AI Engineer Resources Guide

**Curated for your transition from Full-Stack to AI Engineering. Ordered by priority within each category.**

---

## Where to Start (The Critical Path)

If you only have time for 5 things, do these in order:

1. **Andrej Karpathy — "Neural Networks: Zero to Hero"** (YouTube, free) — Start here. A former Tesla/OpenAI director walks you through building a GPT from scratch. The "Let's build GPT" video (~2hrs) is the single best use of your first weekend. It bridges the gap between "I've heard of transformers" and "I understand how they actually work." As a senior engineer, you'll appreciate that he doesn't hand-wave — every line of code is explained.

2. **DeepLearning.AI — "Efficiently Serving LLMs"** (short course, free) — Your second priority. This is directly about inference optimisation: KV cache, continuous batching, quantisation, PagedAttention. It gives you the vocabulary you need for the nScale role specifically. Short enough to finish in a weekend.

3. **Hugging Face — NLP Course** (huggingface.co/learn, free) — The practical "how to use the tools" course. Covers Transformers library, tokenizers, fine-tuning, and the model hub. Chapters 1-4 are essential; the rest is reference material.

4. **vLLM documentation + deployment** (docs.vllm.ai, free) — Read the docs, then deploy a model. This is hands-on practice for the core technology nScale uses for inference serving.

5. **Tim Dettmers' blog** (timdettmers.com, free) — The creator of bitsandbytes. His posts on quantisation and GPU selection are the most practical, no-BS guides available. Read "Which GPU for Deep Learning" and his quantisation posts.

---

## Free Courses (ranked by relevance to nScale role)

**Tier 1 — Do these:**

- **Andrej Karpathy — "Neural Networks: Zero to Hero"** — YouTube playlist, ~20hrs total. Builds from basic neural nets to GPT. The "Let's build GPT" episode alone is worth more than most paid courses. Why first: it builds intuition that makes everything else click faster.

- **DeepLearning.AI — "Efficiently Serving LLMs"** — 1-2 hours. Focused specifically on inference serving. Covers exactly what nScale does. Why early: gives you the right vocabulary before you dive into hands-on work.

- **DeepLearning.AI — "Quantization Fundamentals with Hugging Face"** — Short course on quantisation techniques. Directly maps to nScale's requirements around INT8/4, FP8.

- **Hugging Face NLP Course** — Free, self-paced, very well made. Chapters 1-4 give you working knowledge of the Transformers ecosystem.

**Tier 2 — Do these after Tier 1:**

- **DeepLearning.AI — "Generative AI with LLMs"** (Coursera, audit for free) — Broader foundation. Covers pre-training, fine-tuning, RLHF, and deployment. Good for filling in conceptual gaps after you've done hands-on work.

- **fast.ai — "Practical Deep Learning for Coders"** (course.fast.ai) — Jeremy Howard's legendary course. Top-down approach: build things first, understand theory later. Great if Karpathy's bottom-up approach isn't clicking. Part 2 covers "From Deep Learning Foundations to Stable Diffusion" which is more advanced.

- **Stanford CS229 — Machine Learning** (YouTube) — Andrew Ng's foundational ML course. More theoretical than you need right now, but fills gaps in statistical learning foundations. Watch selectively.

**Tier 3 — Reference / deeper dives:**

- **Stanford CS25 — "Transformers United"** (YouTube) — Guest lectures from researchers at OpenAI, Google, Meta on specific transformer topics. Watch individual talks that match what you're studying.

- **MIT 6.S965 — "TinyML and Efficient Deep Learning"** (YouTube) — Song Han's course on model compression, quantisation, pruning, and efficient inference. Directly relevant to nScale's optimisation work but fairly academic.

---

## YouTube Channels (ranked by usefulness)

- **Andrej Karpathy** — Already mentioned but deserves emphasis. His videos are masterclasses. Watch everything he posts.

- **Yannic Kilcher** — Paper explanations. When you need to understand a specific paper (Flash Attention, DPO, LoRA), his breakdowns are clear and honest about what matters vs what's hype. Not always beginner-friendly, but perfect for your level.

- **3Blue1Brown** — Neural network fundamentals visualised beautifully. His "Neural Networks" series gives you geometric intuition for what's happening inside these models. Watch if the math feels abstract.

- **AI Explained** — News and analysis of AI developments. Good for staying current on what models are being released, benchmark results, and industry direction. Not deep technical content, but important context.

- **Two Minute Papers** — Quick overviews of new research. Good for scanning what's happening in the field without committing 2 hours per paper.

- **Umar Jamil** — Detailed code walkthroughs of transformer architectures, attention mechanisms, and model implementations in PyTorch. Great for the Rung 3 (transformers) and Rung 8 (GPU) parts of the ladder.

---

## Books (ranked by priority)

- **"Designing Machine Learning Systems" by Chip Huyen** — Start here. This book is about ML engineering, not ML research. Covers deployment, monitoring, data pipelines, and production ML systems. It's the bridge between your software engineering background and the ML world. Written for engineers, not researchers.

- **"Deep Learning" by Ian Goodfellow, Yoshua Bengio, Aaron Courville** (deeplearningbook.org, free online) — The canonical textbook. Dense and mathematical. You don't need to read cover-to-cover — use it as a reference when you need to understand the theory behind something you've seen in practice. Chapters on optimisation and regularisation are especially useful.

- **"Programming PyTorch" by Ian Pointer** — Practical PyTorch handbook. Good reference for when you're writing code and need to look up patterns. Less useful if you prefer learning from videos/tutorials.

- **"Natural Language Processing with Transformers" by Lewis Tunstall et al.** — O'Reilly book by Hugging Face engineers. Covers the Transformers ecosystem in depth. Good after you've done the HF course and want more detail on specific topics.

- **"Efficient Deep Learning" by Gaurav Menghani** — Covers model compression, quantisation, pruning, distillation, and efficient architectures. Directly relevant to nScale's optimisation requirements.

---

## Podcasts

- **Latent Space** — The best AI engineering podcast. Hosted by swyx and Alessio. Interviews with engineers building AI infrastructure at scale. The episodes on inference optimisation, vLLM, and model serving are directly relevant. Listen to recent episodes about inference serving and GPU infrastructure.

- **Gradient Dissent (Weights & Biases)** — Interviews with ML practitioners. More research-oriented than Latent Space, but good episodes on training at scale and experiment tracking.

- **The TWIML AI Podcast** — Long-running, wide-ranging. Good for breadth. Search for episodes on inference, quantisation, or distributed training specifically.

- **Practical AI** — Beginner-friendly. Good for the early rungs of the ladder when concepts are still new. Less useful once you're past the fundamentals.

---

## Essential Blog Posts & Articles

These are specific pieces that punch above their weight — each one will teach you more per hour than most courses:

- **Horace He — "Making Deep Learning Go Brrrr From First Principles"** — The single best explanation of GPU performance. Covers compute-bound vs memory-bound workloads, arithmetic intensity, and why batch size matters. Read this before Rung 8.

- **Lilian Weng — "Large Transformer Model Inference Optimization"** (lilianweng.github.io) — Comprehensive survey of inference optimisation techniques. Covers everything from quantisation to speculative decoding. Bookmark and re-read as you climb the ladder.

- **Jay Alammar — "The Illustrated Transformer"** — Visual explanation of the transformer architecture. Print it out and reference it while watching Karpathy's videos.

- **Sebastian Raschka — "Finetuning Large Language Models"** (magazine.sebastianraschka.com) — Practical guide to fine-tuning. Covers LoRA, QLoRA, dataset preparation, and evaluation. Read before Rung 7.

- **Tri Dao — Flash Attention blog posts** — The author explains why Flash Attention works. Read after you understand the basics of GPU memory hierarchy (Rung 8).

- **vLLM blog** (blog.vllm.ai) — Technical posts about PagedAttention, continuous batching improvements, and new features. Read alongside your vLLM hands-on work.

---

## Key Papers (read strategically, not cover-to-cover)

For each paper: read the abstract, introduction, and conclusion. Skim the method section. Skip the proofs. The goal is understanding, not reproducing results.

- **"Attention Is All You Need"** (Vaswani et al., 2017) — The transformer paper. Read it after watching Karpathy's video so the architecture makes sense.
- **"Efficient Memory Management for LLM Serving with PagedAttention"** (Kwon et al., 2023) — The vLLM paper. Read it alongside deploying vLLM.
- **"LoRA: Low-Rank Adaptation of Large Language Models"** (Hu et al., 2021) — Short and clear. Read before fine-tuning.
- **"QLoRA: Efficient Finetuning of Quantized LLMs"** (Dettmers et al., 2023) — Extends LoRA with 4-bit base models. Read after LoRA.
- **"Direct Preference Optimization"** (Rafailov et al., 2023) — How DPO replaces RLHF. Read the intro and method sections.
- **"FlashAttention: Fast and Memory-Efficient Exact Attention"** (Dao et al., 2022) — Read after GPU architecture basics.
- **"LLM.int8()"** (Dettmers et al., 2022) — How 8-bit quantisation works for transformers. Read alongside quantisation experiments.
- **"Scaling Laws for Neural Language Models"** (Kaplan et al., 2020) — How performance scales with compute, data, and parameters. Good context for understanding industry decisions.

---

## Weekly Schedule Suggestion

For your 15-20 hours/week budget:

**Weekday evenings (1-2 hrs/night):** Watch videos, read papers/blogs, do course exercises. This is absorption time.

**Saturday (4-6 hrs):** Hands-on coding. Deploy models, run experiments, write benchmarking code. This is practice time.

**Sunday (2-3 hrs):** Write up what you learned. Update your notes. Plan next week. This is consolidation time — writing forces understanding.

---

## One Principle

Don't try to learn everything before doing anything. The most effective pattern is: learn a concept → immediately try it on a GPU → break something → fix it → now you actually understand it. Rent a GPU for 2 hours, not 2 days. Short intense sessions beat long passive ones.

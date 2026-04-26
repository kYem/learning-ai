# Roadmap: From Full-Stack Tech Lead to nScale Specialised AI Engineer

**Target role:** Specialised AI Engineer @ nScale (London, UK)
**Current profile:** Tech Lead / Senior Full Stack Developer, 10+ years experience
**Date created:** 11 April 2026

---

## Honest Gap Assessment

This is a senior/staff-level ML infrastructure role. The gap between your current profile and what nScale needs is significant — but not insurmountable. Your strengths in production systems, Kubernetes, cloud infrastructure, and team leadership are genuinely valuable. What's missing is deep, hands-on ML systems experience.

### What you already have (leverage these)

| nScale Requirement | Your Experience |
|---|---|
| Production systems at scale | 100M+ monthly views at Interactive Investor, high-traffic platforms |
| Kubernetes & containers | Docker + K8s in production at WWG |
| Cloud infrastructure (AWS, GCP) | Lambda, SQS, EC2, GCP, serverless architectures |
| CI/CD & engineering fundamentals | Cut build times 2x, 17% to 60% test coverage |
| API design | REST APIs, GraphQL, microservices |
| Team leadership | Leading 6 devs, sprint planning, architecture decisions |
| On-call & incident response | Shared on-call with CTO, production incident triaging |

### What you're missing (the real work)

| nScale Requirement | Gap Level |
|---|---|
| Python + PyTorch (production ML systems) | **Critical** — You work in TypeScript/Go/PHP |
| Transformer architectures & LLMs in production | **Critical** — You've used AI tools, not built AI systems |
| Inference optimisation (KV cache, batching, speculative decoding) | **Critical** — Entirely new domain |
| GPU/CUDA programming | **Critical** — No experience |
| Distributed training (data/model parallelism, sharding) | **Critical** — No experience |
| Quantisation (INT8/4, FP8), pruning, compression | **High** — No experience |
| Fine-tuning (LoRA, QLoRA, RLHF, DPO) | **High** — No experience |
| Evaluation & benchmarking frameworks | **Medium** — Concepts are learnable |

---

## The Strategy

You won't close a 4+ year ML experience gap in weeks. Instead, aim for a **credible pivot narrative**:

> "I'm a production systems veteran who has gone deep on ML infrastructure. I bring the reliability, monitoring, and scale engineering that AI teams desperately need — now combined with hands-on ML systems experience."

**Timeline:** 8-12 weeks of focused weekend + evening work before applying (or apply sooner and keep learning in parallel).

---

## Phase 1: Foundations (Weeks 1-3)

**Goal:** Get fluent in Python for ML, understand transformer architecture, and deploy your first model.

### Week 1: Python for ML + Transformer Fundamentals

**Why:** Everything at nScale is Python/PyTorch. You need to be fluent, not just capable.

- [ ] **Complete:** Andrej Karpathy's "Neural Networks: Zero to Hero" YouTube series (at minimum, watch "Let's build GPT" — ~2hrs). This gives you intuition for how transformers actually work, not just the theory.
- [ ] **Hands-on:** Set up a Python ML dev environment. Install PyTorch, Jupyter, and run the basic tutorials at pytorch.org/tutorials.
- [ ] **Read:** "Attention Is All You Need" paper (the original transformer paper). Don't try to understand every equation — focus on the architecture diagram and the intuition behind self-attention, multi-head attention, and positional encoding.
- [ ] **Read:** Jay Alammar's "The Illustrated Transformer" blog post — best visual explanation available.
- [ ] **Code:** Implement a simple self-attention mechanism from scratch in PyTorch (even a toy version). This forces you to understand tensor operations.

**Deliverable:** You can explain how a transformer processes a sequence, what KV cache is at a high level, and write basic PyTorch code.

### Week 2: LLM Serving — The DeepLearning.AI Course + vLLM

**Why:** Inference is nScale's bread and butter. This is where your "Starter AI" plan begins.

- [ ] **Complete:** DeepLearning.AI "Efficiently Serving LLMs" course. Take notes on every term: KV cache, continuous batching, PagedAttention, tensor parallelism, prefill vs decode.
- [ ] **Hands-on:** Rent a GPU (A10G on RunPod or Lambda Labs, ~$0.40/hr). Deploy Llama 3 8B using vLLM.
- [ ] **Experiment:** Run benchmarks with vLLM. Measure tokens/second, latency at different batch sizes, and memory usage. Write down what you observe.
- [ ] **Read:** The vLLM paper ("Efficient Memory Management for Large Language Model Serving with PagedAttention"). Understand how PagedAttention solves the KV cache memory fragmentation problem.

**Deliverable:** A running vLLM deployment you can query, with benchmark numbers you can discuss in an interview.

### Week 3: Quantisation + Model Compression

**Why:** nScale specifically lists "Quantisation (INT8/4, FP8), sparsity, pruning, and model compression."

- [ ] **Hands-on:** Take a 16-bit model (e.g. Llama 3 8B) and quantise it to 4-bit using `bitsandbytes`. Compare inference speed and output quality.
- [ ] **Hands-on:** Try GPTQ and AWQ quantisation methods. Understand the difference between post-training quantisation and quantisation-aware training.
- [ ] **Read:** Tim Dettmers' blog posts on quantisation (he created bitsandbytes). Understand what INT4, INT8, FP8, and NF4 mean in practice.
- [ ] **Experiment:** Deploy both the FP16 and INT4 versions on the same GPU. Measure memory usage, throughput, and run a simple quality comparison (ask the same questions, compare answers).

**Deliverable:** A comparison table (memory, speed, quality) between FP16 and INT4 for the same model. This becomes a talking point in interviews.

---

## Phase 2: Go Deeper (Weeks 4-6)

**Goal:** Build hands-on experience with the specific systems nScale works on.

### Week 4: Fine-tuning with LoRA and QLoRA

**Why:** nScale lists "Fine-tuning (LoRA, QLoRA, adapters, full fine-tuning)" as a core responsibility.

- [ ] **Read:** The LoRA paper ("Low-Rank Adaptation of Large Language Models"). Understand why it works — you're only training a small number of additional parameters.
- [ ] **Hands-on:** Fine-tune Llama 3 8B on a small custom dataset using the Hugging Face `peft` library + QLoRA. A good starting task: fine-tune on a specific instruction format or domain (e.g. coding, medical, legal).
- [ ] **Experiment:** Compare base model vs fine-tuned model on your task. Measure training time, GPU memory, and output quality.
- [ ] **Read:** Understand DPO (Direct Preference Optimisation) at a conceptual level — how it replaces the reward model in RLHF. Read the DPO paper abstract + a good summary blog post.

**Deliverable:** A fine-tuned model you deployed and can discuss the trade-offs of.

### Week 5: Distributed Systems for ML

**Why:** nScale needs "distributed compute and training paradigms (data/model parallelism, sharding, scheduling)."

- [ ] **Read:** Hugging Face's guide on distributed training with `accelerate`. Understand data parallelism vs model parallelism vs pipeline parallelism.
- [ ] **Hands-on:** If you can rent 2+ GPUs, try distributed inference with tensor parallelism in vLLM. See how the model is split across GPUs.
- [ ] **Study:** DeepSpeed ZeRO stages (ZeRO-1, 2, 3). Understand what each stage shards (optimizer states, gradients, parameters).
- [ ] **Read:** FSDP (Fully Sharded Data Parallel) documentation from PyTorch. Understand how it compares to DeepSpeed.
- [ ] **Connect to your experience:** Think about how Kubernetes scheduling, node affinity, and resource management apply to GPU workloads. This is where your K8s experience becomes valuable.

**Deliverable:** You can whiteboard data parallelism vs tensor parallelism vs pipeline parallelism, and explain when to use each.

### Week 6: GPU Fundamentals + CUDA Basics

**Why:** nScale wants "GPU/accelerator optimisation (CUDA, ROCm, or similar)" and "memory management."

- [ ] **Watch:** NVIDIA's "Getting Started with CUDA" tutorials. You don't need to become a CUDA expert, but you need to understand kernels, threads, blocks, shared memory.
- [ ] **Read:** "Making Deep Learning Go Brrrr From First Principles" by Horace He. Best explanation of GPU performance bottlenecks (compute-bound vs memory-bound).
- [ ] **Hands-on:** Use `nvidia-smi` and `torch.profiler` to profile a model inference. Understand GPU utilisation, memory bandwidth, and kernel launch overhead.
- [ ] **Study:** Flash Attention — read the paper abstract and understand why it's faster (it's about memory access patterns, not fewer operations). This directly relates to nScale's work.
- [ ] **Read:** NVIDIA's blog on FP8 training and inference. Understand the H100/H200 tensor core capabilities.

**Deliverable:** You can discuss GPU memory hierarchy, why batch size matters for throughput, and what makes inference memory-bound vs compute-bound.

---

## Phase 3: Build Your Portfolio (Weeks 7-10)

**Goal:** Create tangible evidence of your skills. nScale will want to see you've actually done this, not just read about it.

### Week 7-8: Build an Inference Benchmarking Tool

**Why:** This combines your engineering skills with ML knowledge, directly relevant to nScale's evaluation systems work.

- [ ] **Build (in Python):** A tool that benchmarks different model configurations — FP16 vs INT4 vs INT8, different batch sizes, different sequence lengths. Output clean metrics: time-to-first-token (TTFT), tokens/second, p50/p95/p99 latency, GPU memory usage.
- [ ] **Containerise it:** Dockerfile + K8s manifest. This shows nScale you can bridge the gap between ML and infrastructure.
- [ ] **Open-source it on GitHub.** Well-documented, with a README showing example results.

### Week 9-10: Build a Simple Model Serving Platform

**Why:** This is literally nScale's product. Even a simplified version shows you understand the domain.

- [ ] **Build:** A TypeScript/Python API service that wraps vLLM, adds rate limiting, authentication, usage tracking, and health checks. OpenAPI 3.0 spec (nScale specifically mentions this).
- [ ] **Add:** A monitoring dashboard (Grafana + Prometheus) tracking GPU utilisation, request latency, queue depth, error rates.
- [ ] **Deploy on K8s:** Auto-scaling based on GPU utilisation. Model loading/unloading.
- [ ] **GitHub:** Open-source with good docs. This is your interview showpiece.

**Deliverable:** A GitHub repo that demonstrates you can build production AI infrastructure, not just use AI tools.

---

## Phase 4: Interview Preparation (Weeks 10-12)

### Your Narrative

Frame your story around this transition:

> "For the past 8 years I've built and operated production systems at scale — 100M+ monthly views, on-call incident response, CI/CD pipelines, Kubernetes orchestration. Over the past [X] months, I've gone deep on ML infrastructure: deploying LLMs with vLLM, optimising inference with quantisation, fine-tuning with LoRA, and building GPU monitoring systems. I bring something most ML engineers don't — a decade of making systems reliable, observable, and maintainable in production."

### Key Topics to Study for Technical Interviews

- [ ] **KV cache management:** How it works, why it's the bottleneck in autoregressive generation, how PagedAttention solves fragmentation
- [ ] **Continuous batching:** How it differs from static batching, why it matters for throughput
- [ ] **Speculative decoding:** Use a small draft model to generate candidates, verify with the large model in parallel
- [ ] **Quantisation trade-offs:** When to use INT4 vs INT8 vs FP8, impact on quality vs speed vs memory
- [ ] **LoRA vs full fine-tuning:** When each is appropriate, memory implications, serving multiple LoRA adapters
- [ ] **RLHF vs DPO:** Why DPO is simpler (no reward model needed), trade-offs
- [ ] **Distributed training:** Data parallelism, tensor parallelism, pipeline parallelism, ZeRO
- [ ] **GPU memory hierarchy:** HBM, L2 cache, shared memory, registers. Why memory bandwidth matters more than compute for inference
- [ ] **System design:** How would you design a multi-tenant inference platform? (This is nScale's product)

### Your Competitive Advantages (use these in interviews)

1. **Reliability engineering:** "How would you ensure 99.9% uptime for a GPU inference fleet?" You know monitoring, alerting, graceful degradation, circuit breakers. Most ML engineers don't.
2. **API design at scale:** You've built APIs serving millions of requests. nScale needs "developer-facing APIs, SDKs, and tooling."
3. **Kubernetes expertise:** GPU scheduling on K8s is a real challenge. You already know K8s deeply.
4. **Team leadership:** nScale says "collaborate with research, infrastructure, and product teams." You've led cross-functional delivery for 3.5 years.
5. **Testing discipline:** 17% to 60% coverage shows you care about quality. ML codebases are notoriously undertested.

---

## Resources Checklist

### Courses
- [ ] DeepLearning.AI "Efficiently Serving LLMs" — **Priority 1**
- [ ] Andrej Karpathy "Neural Networks: Zero to Hero" (YouTube) — **Priority 1**
- [ ] fast.ai Practical Deep Learning — Optional but excellent

### Papers (read abstract + key sections, not cover-to-cover)
- [ ] "Attention Is All You Need" (Vaswani et al.) — Transformer architecture
- [ ] "Efficient Memory Management for LLM Serving with PagedAttention" — vLLM
- [ ] "LoRA: Low-Rank Adaptation of Large Language Models" (Hu et al.)
- [ ] "Direct Preference Optimization" (Rafailov et al.)
- [ ] "FlashAttention: Fast and Memory-Efficient Exact Attention" (Dao et al.)
- [ ] "LLM.int8(): 8-bit Matrix Multiplication for Transformers" (Dettmers et al.)

### Blog Posts & Articles
- [ ] Jay Alammar — "The Illustrated Transformer"
- [ ] Horace He — "Making Deep Learning Go Brrrr From First Principles"
- [ ] Tim Dettmers — Blog posts on quantisation
- [ ] Lilian Weng — "Large Transformer Model Inference Optimization"
- [ ] vLLM documentation and blog

### Tools to Get Familiar With
- [ ] PyTorch (core framework)
- [ ] vLLM (inference engine)
- [ ] Hugging Face Transformers + PEFT
- [ ] bitsandbytes (quantisation)
- [ ] DeepSpeed (distributed training)
- [ ] NVIDIA nvidia-smi, nsight, torch.profiler
- [ ] Weights & Biases or MLflow (experiment tracking)

### GPU Rental
- RunPod: A10G from ~$0.40/hr, H100 from ~$2.50/hr
- Lambda Labs: Similar pricing, good for multi-GPU
- vast.ai: Cheapest option, less reliable

---

## Realistic Timeline & Effort

| Phase | Weeks | Hours/Week | Total Hours |
|---|---|---|---|
| 1: Foundations | 1-3 | 15-20 | ~50 |
| 2: Go Deeper | 4-6 | 15-20 | ~50 |
| 3: Portfolio | 7-10 | 10-15 | ~50 |
| 4: Interview Prep | 10-12 | 10 | ~20 |
| **Total** | **12 weeks** | | **~170 hours** |

GPU rental budget: approximately $50-100 total (rent by the hour, shut down when done).

---

## When to Apply

You have two options:

**Option A — Apply now, learn in parallel.** Hiring processes take 2-4 weeks. You could be in Phase 2-3 by the time you interview. Risk: you might not be ready for deep technical questions.

**Option B — Apply at Week 8.** You'll have the foundations + portfolio. More credible, but the role might fill.

**My recommendation:** Apply at Week 4-5. You'll have the vocabulary from Phase 1 and can demonstrate genuine momentum. In your cover letter, be upfront about the transition and emphasize your production systems DNA. The nScale posting says "preferred" for many items — the hard requirements are really about systems engineering at scale, which you have.

---

## One Honest Note

This role requires 4+ years of hands-on ML experience in production AI environments. Even with excellent preparation, you'll be competing against candidates who have this experience. Your best angle is positioning yourself as a **systems/infrastructure engineer who deeply understands ML**, rather than an ML researcher. nScale is building infrastructure — they need people who can make it reliable, fast, and developer-friendly. That's your superpower.

If this specific role doesn't work out, the preparation here also qualifies you for **ML Platform Engineer**, **MLOps Engineer**, or **AI Infrastructure Engineer** roles, which are in very high demand and often have slightly lower ML-specific requirements.

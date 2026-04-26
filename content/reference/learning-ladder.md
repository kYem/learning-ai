# AI Engineer Learning Ladder

**From zero to nScale-ready. Each rung builds on everything below it.**

---

## Rung 1: Python for ML (You are here)

**Where you start:** You know TypeScript/Go/PHP. Python feels like a step backward, but it's the universal language of ML.

**What to learn:**
- Python fluency: list comprehensions, generators, decorators, type hints
- NumPy: array operations, broadcasting, reshaping — the foundation of all tensor libraries
- Jupyter notebooks: the standard for experimentation and sharing results
- `pip`, `conda`, virtual environments — ML dependency management is messier than `npm`

**You've climbed this rung when:** You can write a NumPy matrix multiplication from scratch, reshape tensors without looking up the docs, and debug shape mismatch errors by reading the traceback.

**Time estimate:** 1 week (evenings)

---

## Rung 2: PyTorch Fundamentals

**What you're building on:** Python + NumPy fluency

**What to learn:**
- Tensors: creation, indexing, slicing, device placement (CPU vs GPU)
- Autograd: how automatic differentiation works — `loss.backward()`, `.grad`, computation graphs
- `nn.Module`: how to define layers, forward pass, parameter registration
- Training loop: forward → loss → backward → optimizer step → zero_grad
- Data loading: `Dataset`, `DataLoader`, batching, shuffling

**You've climbed this rung when:** You can train a simple neural network (e.g. MNIST classifier) from scratch in PyTorch — no copying code, from memory. You understand what every line does.

**Time estimate:** 1 week

---

## Rung 3: How Transformers Work

**What you're building on:** PyTorch basics, tensor operations

**What to learn:**
- The attention mechanism: queries, keys, values, scaled dot-product attention
- Multi-head attention: why multiple heads, how they're concatenated
- Positional encoding: why it's needed (attention has no notion of order), sinusoidal vs learned vs RoPE
- The full transformer block: LayerNorm → Multi-Head Attention → Residual → LayerNorm → FFN → Residual
- Tokenisation: BPE, SentencePiece — how text becomes numbers
- Autoregressive generation: how a decoder generates one token at a time

**You've climbed this rung when:** You can explain the transformer architecture on a whiteboard. You've watched Karpathy's "Let's build GPT" and could modify the code. You understand why the KV cache exists (avoid recomputing attention for past tokens).

**Time estimate:** 1-2 weeks

---

## Rung 4: Using Pre-trained LLMs

**What you're building on:** Transformer architecture understanding

**What to learn:**
- Hugging Face Transformers: loading models, tokenizers, `generate()`, `pipeline()`
- Prompt engineering from the model side: how system prompts, few-shot examples, and temperature actually affect generation
- Model formats: safetensors, GGUF, the Hugging Face Hub ecosystem
- Inference basics: `torch.no_grad()`, `model.eval()`, `torch.cuda.amp` for mixed precision
- Benchmarking: measuring tokens/second, latency, memory usage with `torch.cuda.memory_allocated()`

**You've climbed this rung when:** You can download a model from Hugging Face, run inference on a GPU, measure its performance, and explain why it uses the amount of memory it does (2 bytes/param for FP16, plus KV cache).

**Time estimate:** 1 week

---

## Rung 5: LLM Serving & Inference Optimisation

**What you're building on:** Using models + understanding their architecture

**Why this matters:** This is the core of what nScale does. Everything below was warmup for this.

**What to learn:**
- vLLM: deploy a model, understand PagedAttention, continuous batching, and the OpenAI-compatible API
- KV cache management: why it's the memory bottleneck, how PagedAttention allocates in blocks
- Continuous vs static batching: why continuous batching gives 2-10x throughput improvement
- Speculative decoding: draft model generates candidates, target model verifies in parallel
- Prefill vs decode: prefill is compute-bound (processing the prompt), decode is memory-bound (generating tokens one at a time)
- Serving metrics: TTFT (time-to-first-token), TPOT (time-per-output-token), throughput (tokens/sec)

**You've climbed this rung when:** You've deployed vLLM, benchmarked it at different batch sizes and sequence lengths, and can explain why throughput increases with batch size but TTFT gets worse. You know what continuous batching does and why PagedAttention matters.

**Time estimate:** 1-2 weeks

---

## Rung 6: Quantisation & Model Compression

**What you're building on:** Inference optimisation, model memory understanding

**What to learn:**
- Why quantise: fewer bits = less memory = larger batches = more throughput
- Post-training quantisation: GPTQ, AWQ — quantise after training, no retraining needed
- Runtime quantisation: bitsandbytes INT8/NF4 — quantise on load
- FP8: the H100's native format, used by TensorRT-LLM and increasingly by vLLM
- Quality vs speed trade-offs: always benchmark on YOUR task after quantising
- Pruning and sparsity: zeroing out weights, structured vs unstructured pruning
- Model distillation: training a smaller model to mimic a larger one

**You've climbed this rung when:** You've quantised the same model to FP16, INT8, and INT4, measured the speed/memory/quality differences, and can recommend which to use for a given scenario (latency-sensitive vs cost-sensitive vs quality-sensitive).

**Time estimate:** 1-2 weeks

---

## Rung 7: Fine-tuning & Alignment

**What you're building on:** Model architecture, quantisation (for QLoRA)

**What to learn:**
- LoRA: low-rank adaptation — train small adapter matrices, freeze the base model. Understand rank, alpha, target modules
- QLoRA: LoRA on top of a 4-bit quantised base model — fine-tune 70B models on a single GPU
- Full fine-tuning: when you need it (domain shift, new capabilities), why it's expensive
- Dataset preparation: instruction format, chat templates, data quality matters more than quantity
- RLHF: reward model training, PPO optimisation — the original alignment approach
- DPO: direct preference optimisation — simpler alternative, no reward model needed
- Evaluation: perplexity, BLEU/ROUGE for specific tasks, human eval, LLM-as-judge

**You've climbed this rung when:** You've fine-tuned a model with LoRA, evaluated it against the base model, and can explain the trade-offs between LoRA rank sizes. You understand the RLHF pipeline conceptually and why DPO simplifies it.

**Time estimate:** 2 weeks

---

## Rung 8: GPU Architecture & Performance

**What you're building on:** Everything above — now you understand WHY things are slow

**What to learn:**
- GPU memory hierarchy: HBM (high bandwidth, large) → L2 cache → shared memory → registers
- Compute vs memory bound: training is compute-bound, inference (decode) is memory-bandwidth-bound
- CUDA basics: threads, blocks, grids, warps. You don't need to write CUDA, but you need to read it
- Triton: OpenAI's Python-like kernel language — the modern way to write GPU kernels
- Flash Attention: why it's faster (tiles attention to fit in SRAM, avoids HBM round-trips)
- Profiling: `torch.profiler`, NVIDIA Nsight, `nvidia-smi`, understanding kernel traces
- Tensor cores: specialised hardware for matrix multiply. FP16, BF16, FP8 on H100

**You've climbed this rung when:** You can look at a profiler trace and identify whether a workload is compute-bound or memory-bound. You can explain why Flash Attention is faster despite doing the same math. You know what "arithmetic intensity" means.

**Time estimate:** 2 weeks

---

## Rung 9: Distributed Systems for ML

**What you're building on:** GPU knowledge + model architecture + your existing K8s/infra experience

**What to learn:**
- Data parallelism: replicate model on N GPUs, split data, average gradients. Simple, scales well
- Tensor parallelism: split individual layers across GPUs. Needed when model doesn't fit on one GPU. High communication
- Pipeline parallelism: split layer groups across GPUs. Lower communication, bubble overhead
- DeepSpeed ZeRO: stage 1 (shard optimizer), stage 2 (+ gradients), stage 3 (+ parameters)
- PyTorch FSDP: Facebook's answer to DeepSpeed. Simpler API, native PyTorch
- NCCL: NVIDIA's communication library. AllReduce, AllGather — the primitives of distributed ML
- Multi-node training: network topology matters. InfiniBand vs ethernet. NVLink vs PCIe
- Kubernetes for GPUs: device plugins, node selectors, topology-aware scheduling, MIG

**You've climbed this rung when:** You can design a training setup for a 70B model across multiple nodes. You know when to use TP vs PP vs DP. You can explain ZeRO stages and their trade-offs. Your K8s experience makes this rung faster than expected.

**Time estimate:** 2 weeks

---

## Rung 10: Production AI Platform Engineering

**What you're building on:** Everything — this is where all rungs converge

**What to learn:**
- Multi-tenant serving: request routing, isolation, fair scheduling, priority queues
- Model lifecycle: versioning, A/B testing, canary deployments, rollback
- Autoscaling: GPU-aware scaling (not just CPU), pre-warming, scale-to-zero economics
- Monitoring & observability: GPU metrics (utilisation, memory, temperature), request-level tracing, SLO dashboards
- API design: OpenAI-compatible APIs, streaming, function calling, tool use. OpenAPI 3.0 specs
- Cost optimisation: spot instances for training, right-sizing GPU types, batching strategies for throughput
- Evaluation systems: automated quality benchmarks, regression detection, safety checks
- Reliability: health checks, graceful degradation, circuit breakers, chaos engineering for GPU failures

**You've climbed this rung when:** You can design and build a production inference platform from scratch — model loading, request batching, autoscaling, monitoring, and API layer. This is the nScale job. Your 10+ years of production engineering makes this your strongest rung.

**Time estimate:** Ongoing (this is the job itself)

---

## The Full Ladder at a Glance

```
Rung 10: Production AI Platform Engineering  ← THE NSCALE JOB
Rung  9: Distributed Systems for ML
Rung  8: GPU Architecture & Performance
Rung  7: Fine-tuning & Alignment
Rung  6: Quantisation & Model Compression
Rung  5: LLM Serving & Inference Optimisation  ← THE CORE SKILL
Rung  4: Using Pre-trained LLMs
Rung  3: How Transformers Work
Rung  2: PyTorch Fundamentals
Rung  1: Python for ML  ← YOU START HERE
```

**Total estimated time:** 12-16 weeks at 15-20 hrs/week

**Key insight:** Rungs 1-4 are foundation. Rung 5 is where you become relevant to nScale. Rungs 6-9 are depth that makes you competitive. Rung 10 is where your existing experience gives you a genuine advantage over ML-only engineers.

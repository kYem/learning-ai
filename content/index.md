# AI Learning Roadmap

> Track progress across weekends. Check off items as you go, and link to your notes.

## Weekend 1 — Vocabulary & Foundations
**Goal:** Finish DeepLearning.AI "Efficiently Serving LLMs"

- [ ] Enroll and start the course
- [ ] Module: Batching strategies → notes: [[concepts/batching]]
- [ ] Module: KV-Cache deep dive → notes: [[concepts/kv-cache]]
- [ ] Module: Quantization intro → notes: [[concepts/quantization]]
- [ ] Module: Model serving patterns → notes: [[concepts/model-serving]]
- [ ] Write a 1-paragraph summary of key takeaways

## Weekend 2 — Hands-On Deployment
**Goal:** Rent a GPU and deploy Llama 3 with vLLM

- [ ] Pick a GPU provider (Lambda Labs / RunPod) → notes: [[projects/gpu-rental-setup]]
- [ ] Install vLLM and dependencies → notes: [[projects/vllm-deployment]]
- [ ] Deploy Llama 3, run basic prompts
- [ ] Measure baseline latency and throughput
- [ ] Experiment with batch sizes and observe GPU utilization
- [ ] Document what broke and how you fixed it

## Weekend 3 — Quantization Experiments
**Goal:** Convert a 16-bit model to 4-bit, measure the difference

- [ ] Set up bitsandbytes → notes: [[projects/quantization-experiments]]
- [ ] Quantize a model (FP16 → INT4)
- [ ] Benchmark: latency, throughput, memory usage (before vs after)
- [ ] Compare output quality on a test set
- [ ] Write up findings with actual numbers

## Ongoing — Interview Prep
**Goal:** Frame everything through a reliability/ops lens for nscale

- [ ] Draft talking points: GPU monitoring strategies → notes: [[concepts/gpu-monitoring]]
- [ ] Draft talking points: API rate limiting patterns
- [ ] Draft talking points: 99.9% uptime architecture
- [ ] Practice explaining MoE trade-offs (dense vs sparse) → notes: [[concepts/mixture-of-experts]]
- [ ] Practice explaining KV-cache optimization → notes: [[concepts/kv-cache]]

## Key Concepts Index
> These are your building-block notes. Each one links to others.

| Concept | Status | Links to |
|---------|--------|----------|
| [[concepts/kv-cache]] | 🔲 | batching, model-serving, vllm |
| [[concepts/batching]] | 🔲 | kv-cache, model-serving |
| [[concepts/quantization]] | 🔲 | model-serving, gpu-monitoring |
| [[concepts/model-serving]] | 🔲 | kv-cache, batching, vllm |
| [[concepts/mixture-of-experts]] | 🔲 | model-serving, quantization |
| [[concepts/attention-mechanisms]] | 🔲 | kv-cache, mixture-of-experts |
| [[concepts/gpu-monitoring]] | 🔲 | model-serving |
| [[concepts/vllm]] | 🔲 | kv-cache, batching, model-serving |

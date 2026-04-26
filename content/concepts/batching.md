# Batching

**Status:** Learning
**Related:** [[kv-cache]], [[model-serving]], [[vllm]], [[tensors]]

## What is it?
Batching is processing multiple requests together in a single forward pass through the model, rather than one at a time. GPUs are massively parallel — they're happiest when given large chunks of work. A single request barely scratches the surface of what a GPU can do, so batching lets you fill that capacity.

## The core problem
Without batching: 10 users send requests → GPU processes them one by one → 9 users wait. The GPU spends most of its time idle between requests (memory-bound, not compute-bound).

With batching: 10 requests get grouped into a batch → GPU processes all 10 in one forward pass → everyone gets results faster overall, even though each individual request might take slightly longer.

## Batching strategies

### Static batching (naive)
- Collect N requests, pad them all to the same sequence length, run them together
- **Problem:** if one request is 10 tokens and another is 500, you pad the short one with 490 wasted tokens
- **Problem:** the entire batch waits for the longest request to finish generating
- Simple to implement but wastes GPU compute and memory

### Dynamic batching
- Group requests of similar lengths together to reduce padding waste
- Still waits for the longest request in each batch to finish
- Better than static, but still has the "straggler" problem

### Continuous batching (the big one)
- Don't wait for an entire batch to finish — as soon as one request completes, slot a new one in
- Requests enter and leave the batch independently
- No more waiting for the slowest request to finish
- **This is what vLLM uses** and it's why vLLM achieves much higher throughput
- Also called "iteration-level batching" — decisions happen at each generation step, not per batch

### In-flight batching
- Another name for continuous batching, used by NVIDIA's TensorRT-LLM
- Same concept: requests join and leave the batch dynamically

## Prefill vs Decode phases
Batching interacts with two distinct phases of generation:

### Prefill (prompt processing)
- Process all input tokens at once (can be parallelized)
- Compute-heavy: lots of matrix multiplications
- Fills the KV-cache for all input tokens

### Decode (token generation)
- Generate one new token at a time, sequentially
- Memory-bound: mostly reading from KV-cache
- Much less compute per step than prefill

The challenge: prefill is compute-bound, decode is memory-bound. Mixing them in the same batch can cause interference — a long prefill can stall ongoing decodes. Advanced systems separate or schedule these phases carefully.

## Why it matters for serving (nscale relevance)
- **Throughput vs latency trade-off:** larger batches = higher throughput but higher per-request latency
- **Batch size is a key tuning parameter:** too small = wasted GPU, too large = OOM or latency spikes
- **Monitoring:** batch size, queue depth, and time-to-first-token are critical metrics
- **Continuous batching is table stakes** for production serving — static batching is unacceptable
- Understanding prefill/decode phases helps explain why time-to-first-token differs from inter-token latency

## Key metrics to monitor
- **Time to First Token (TTFT):** how long before the user sees the first word (dominated by prefill)
- **Inter-Token Latency (ITL):** time between each subsequent token (decode phase)
- **Throughput:** tokens per second across all requests
- **Queue depth:** how many requests are waiting to be batched

## Open questions
- How does continuous batching interact with MoE models where different tokens route to different experts?
- What's the optimal batch size for a given GPU and model size?
- How do you handle priority requests (e.g., paid vs free tier) within a batch?

## Sources
- DeepLearning.AI "Efficiently Serving LLMs" - Lesson 1

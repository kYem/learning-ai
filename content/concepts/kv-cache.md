# KV-Cache

**Status:** Learning
**Related:** [[batching]], [[model-serving]], [[vllm]], [[attention-mechanisms]]

## What is it?
During autoregressive generation, the model recomputes attention over all previous tokens at each step. The KV-cache stores the Key and Value matrices from previous tokens so they don't need to be recomputed. This is the single biggest memory bottleneck in LLM serving.

## Key insights

### From Gemma 4 (2026-04-12)
- **K=V trick:** Gemma 4 sets Keys equal to Values in global attention layers, effectively halving the cache for those layers. Minimal quality loss.
- **Grouped Query Attention (GQA):** Global attention uses 8 Query heads per KV head (vs 2 in local attention), drastically reducing what needs caching.
- **p-RoPE:** Only applies positional encoding to 25% of dimensions in global attention. Low-frequency pairs were adding noise rather than useful position info.

## Why it matters for serving (nscale relevance)
- KV-cache size scales with: `batch_size × num_layers × num_heads × head_dim × seq_length × 2 (K+V)`
- This is why vLLM's PagedAttention exists — it manages KV-cache like virtual memory pages
- Quantizing the KV-cache (e.g., FP8 instead of FP16) is a practical optimization

## Open questions
- How does PagedAttention in vLLM handle the K=V optimization? Does it already support this?
- What's the actual memory savings of GQA 8:1 vs 2:1 in practice?

## Sources
- [A Visual Guide to Gemma 4 - Maarten Grootendorst](https://newsletter.maartengrootendorst.com/p/a-visual-guide-to-gemma-4)

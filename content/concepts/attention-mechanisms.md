# Attention Mechanisms

**Status:** Learning
**Related:** [[kv-cache]], [[mixture-of-experts]], [[model-serving]]

## Core idea
Attention lets a model weigh which previous tokens are most relevant when processing the current token. It computes Query, Key, and Value vectors, then uses Q·K similarity to decide how much of each V to mix in.

## Types encountered so far

### Global (Full) Attention
- Every token attends to ALL previous tokens
- Expensive: O(n²) with sequence length
- Used sparingly in Gemma 4 (every 5th or 6th layer)

### Local (Sliding Window) Attention
- Only attends to last N tokens (512 for small models, 1024 for large in Gemma 4)
- Much cheaper, but information "dilutes" across layers — like a game of telephone
- Used for most layers in Gemma 4

### Grouped Query Attention (GQA)
- Multiple Query heads share one KV head
- Gemma 4: 2 Q per KV (local), 8 Q per KV (global)
- Reduces KV-cache size significantly

### Interleaving pattern
- Gemma 4 E2B: 4:1 ratio (4 local, 1 global)
- All other Gemma 4: 5:1 ratio
- Key change from Gemma 3: last layer is ALWAYS global attention

## Positional Encoding
- **RoPE:** Rotates Q/K pairs at decreasing frequencies. High-freq pairs = positional info, low-freq pairs = semantic info.
- **p-RoPE (Gemma 4):** Only applies RoPE to first 25% of dimensions. Prevents low-freq noise from hurting long-context performance.
- **2D RoPE (Vision):** Splits patch embeddings in half — one half gets width position, other gets height. Enables variable aspect ratios.

## Sources
- [A Visual Guide to Gemma 4 - Maarten Grootendorst](https://newsletter.maartengrootendorst.com/p/a-visual-guide-to-gemma-4)

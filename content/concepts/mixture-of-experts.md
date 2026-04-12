# Mixture of Experts (MoE)

**Status:** Learning
**Related:** [[model-serving]], [[quantization]], [[attention-mechanisms]], [[gpu-monitoring]]

## What is it?
Instead of one large feedforward network (FFN) per layer, MoE uses many smaller "expert" FFNs and a router that dynamically picks which experts process each token. Only a fraction of total parameters are active per forward pass.

## Key insights

### From Gemma 4 26B A4B (2026-04-12)
- 128 total experts, 8 activated per token + 1 shared expert (always active)
- Shared expert is 3x larger — holds general knowledge that every token needs
- 26B total params in memory, but only ~4B active during inference
- Key distinction: **sparse params** (loaded in VRAM) vs **active params** (used for compute)

## Why it matters for serving (nscale relevance)
- VRAM planning: you need memory for ALL 26B params, even though compute is 4B-equivalent
- Latency is closer to a 4B model, but memory footprint is 26B
- Load balancing challenge: some experts may get "hot" (routed to more frequently)
- Quantization opportunity: inactive experts could be quantized more aggressively

## Comparison: Dense vs MoE
| Aspect | Dense (31B) | MoE (26B A4B) |
|--------|-------------|---------------|
| Predictable latency | Yes | Varies by routing |
| Memory | 31B | 26B |
| Compute per token | 31B | ~4B |
| Quality | Strong baseline | Competitive, sometimes better |
| Monitoring complexity | Lower | Higher (expert utilization) |

## Open questions
- How do you monitor expert utilization in production?
- What happens when expert routing is unbalanced — does quality degrade?
- Can you shard different experts across different GPUs?

## Sources
- [A Visual Guide to Gemma 4 - Maarten Grootendorst](https://newsletter.maartengrootendorst.com/p/a-visual-guide-to-gemma-4)

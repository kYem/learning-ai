# Logits and Decoding Strategies

**Status:** Learning
**Related:** [[tokenization]], [[tensors]], [[model-serving]]

## What are logits?
Raw, unnormalized scores the model outputs for every possible next token. NOT probabilities — just numbers (can be negative, zero, or positive). Higher = more likely. Apply softmax to convert to actual probabilities (0–1, summing to 1).

## Key insights

### From DeepLearning.AI Course - Lesson 1 (2026-04-12)
- GPT-2 logits shape: `[1, 7, 50257]` = 1 batch × 7 positions × 50,257 vocab scores
- Only the LAST position matters for next-token prediction: `logits[0, -1, :]`
- `argmax()` → pick the single highest score (greedy decoding)
- `torch.topk(logits, k=10)` → get the 10 highest-scoring tokens and their scores

## Decoding strategies

### Greedy (argmax)
- Always pick the highest-scoring token
- Fast, deterministic, but can be repetitive/boring
- `next_token_id = last_logits.argmax()`

### Top-k sampling
- Filter to the k most likely tokens, then randomly sample (weighted by scores)
- Introduces variety while staying reasonable
- k=10 means only the top 10 tokens are candidates

### Top-p (nucleus) sampling
- Instead of a fixed k, include tokens until cumulative probability reaches p (e.g., 0.9)
- Adaptive: sometimes considers 5 tokens, sometimes 50, depending on confidence
- Usually produces better text than fixed top-k

### Temperature
- Scales logits before softmax: `logits / temperature`
- temperature < 1 → sharper distribution → more deterministic (closer to greedy)
- temperature > 1 → flatter distribution → more random/creative
- temperature = 0 → equivalent to argmax

## The pipeline
```
logits → (temperature scaling) → (top-k or top-p filter) → softmax → sample → next token
```

## Why it matters for serving (nscale relevance)
- Decoding strategy is a per-request parameter in APIs (`temperature`, `top_k`, `top_p`)
- Greedy is cheapest; sampling adds overhead but produces better output
- Beam search (exploring multiple paths) multiplies compute by beam width
- Understanding these helps explain latency differences to customers

## Open questions
- How much latency does sampling add vs greedy in practice?
- What are the typical default parameters for production APIs?

## Sources
- DeepLearning.AI "Efficiently Serving LLMs" - Lesson 1

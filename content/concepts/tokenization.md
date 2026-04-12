# Tokenization

**Status:** Learning
**Related:** [[kv-cache]], [[model-serving]], [[tensors]]

## What is it?
The translation layer between human text and numbers a model can process. A tokenizer splits text into chunks (tokens) and maps each to an integer ID from a fixed vocabulary.

## Key insights

### From DeepLearning.AI Course - Lesson 1 (2026-04-12)
- Tokens are NOT always whole words. "uncomfortable" → ["un", "comfort", "able"] = 3 tokens
- GPT-2 vocab: 50,257 possible tokens → `Embedding(50257, 768)` in the model
- `"The quick brown fox jumped over the"` → 7 token IDs: `[464, 2068, 7586, 21831, 11687, 625, 262]`
- Tokenizer produces `input_ids` (the token integers) and `attention_mask` (which tokens to attend to, all 1s for normal input)

## Why it matters for serving (nscale relevance)
- **Token count = cost.** KV-cache, compute, and latency all scale with tokens, not words
- Different models use different tokenizers — same text can produce different token counts
- Context window limits (e.g., 128K tokens) are measured in tokens, not characters
- Tokenization itself is fast (CPU-bound), but the token count it produces determines GPU load

## Tokenizer types to know
- **BPE (Byte-Pair Encoding):** Used by GPT-2, GPT-4, Llama. Merges frequent byte pairs iteratively
- **SentencePiece:** Used by Gemma, T5. Language-agnostic, works directly on raw text
- **WordPiece:** Used by BERT. Similar to BPE but slightly different merge strategy

## Open questions
- How does tokenizer choice affect multilingual performance?
- What's the relationship between vocab size and model quality?

## Sources
- DeepLearning.AI "Efficiently Serving LLMs" - Lesson 1

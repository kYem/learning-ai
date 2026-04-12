# Tensors

**Status:** Learning
**Related:** [[tokenization]], [[kv-cache]], [[quantization]]

## What is it?
A multi-dimensional array of numbers — the universal data container in ML. Like a strictly-typed, GPU-accelerated version of nested arrays.

## Key insights

### From DeepLearning.AI Course - Lesson 1 (2026-04-12)
- Scalar (0D), Vector (1D), Matrix (2D), 3D+ tensor — just increasing dimensions
- GPT-2 logits shape: `[1, 7, 50257]` = 1 batch × 7 tokens × 50,257 vocab scores
- `logits[0, -1, :]` → the 50,257 scores for the LAST token position (what comes next)
- `argmax()` picks the highest-scoring token ID from these scores
- `torch.topk(logits, k=10)` gives the 10 most likely next tokens

### Shape matters
- Shapes tell you what the data means: `[batch_size, sequence_length, vocab_size]`
- Mismatched shapes = errors. Always check `.shape` when debugging

## Why it matters for serving (nscale relevance)
- **Tensor dtype = memory usage.** FP32 (4 bytes) vs FP16 (2 bytes) vs INT4 (0.5 bytes) per element
- This is the foundation of quantization — same tensor, fewer bits per number
- GPU memory is measured by how many tensor elements fit in VRAM
- Batch dimension (first dim) is how you serve multiple requests at once

## PyTorch vs TensorFlow vs JAX
| Framework | Used by | Key trait | Relevance to serving |
|-----------|---------|-----------|---------------------|
| **PyTorch** | Llama, Gemma, Mistral, vLLM | Eager execution, debug-friendly | Primary — what you'll use |
| **TensorFlow** | Older Google models | Graph-based (TF1), eager (TF2) | Legacy systems only |
| **JAX** | DeepMind research, training | Pure functions, TPU-native | Training only, not serving |

## Open questions
- How do tensor memory layouts (contiguous vs non-contiguous) affect GPU performance?

## Sources
- DeepLearning.AI "Efficiently Serving LLMs" - Lesson 1

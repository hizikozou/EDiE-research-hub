# WHY_DAY001 — Introducing IWR: Iterative Why Robustness
*(EDiE Research Log / Day 1)*

## Notice
This document is an ongoing research log. It may contain provisional hypotheses and incomplete results.

---

## 1. Purpose
This day establishes **WHY** as a research track under **Evolutionary Discovery Engineering (EDiE)** and proposes a new evaluation unit:

> **IWR — Iterative Why Robustness**

The goal is to define, operationalize, and validate IWR as a practical metric for measuring **semantic stability under repeated causal questioning**.

---

## 2. Background & Motivation
Humans (especially children) naturally perform “why-chains”:
- Why?  
- Why is that?  
- Why does that cause hold?  
… potentially without end.

For AI systems, repeated “why” questions expose failure modes such as:
- semantic drift
- circular answers
- template repetition
- avoidance or refusal inflation
- loss of earlier assumptions

This suggests a measurable property:
> **How long and how well an AI can maintain coherent causal explanations under iterative “why” pressure.**

---

## 3. Definition (Draft): IWR
**IWR** measures how robust a model remains during an iterative why-chain.

### 3.1 Minimal Operational Definition
Given:
- an initial prompt **P0**
- an iterative operator **Why(·)** that produces follow-up prompts
- a conversation history **Hk** up to step k

We define:
- a maximum depth **K** (e.g., 10–30)
- a failure condition **F(k)** that detects collapse

**IWR (depth-based)**:
- **IWR = max k such that NOT F(k)**

Where collapse may include:
- contradiction with earlier statements
- non-answer / evasion
- circular reasoning (self-reference without new causal content)
- unrelated content (topic drift)
- repetitive paraphrase without causal progress

### 3.2 Optional Quality Components (future)
In addition to depth, we may track:
- **Coherence**: consistency with prior steps
- **Novel causal content**: not just paraphrases
- **Explicit uncertainty handling**: “unknown” vs hallucination
- **Compression**: ability to summarize the chain without losing meaning

---

## 4. Protocol (MVP) — Reproducible Test
### 4.1 Setup
- Choose a seed question P0 (domain-specific or general).
- Fix parameters:
  - max depth K
  - temperature, top_p, max tokens
  - system prompt (if any)
- Record full transcripts.

### 4.2 Iteration Rule
At each step:
1. Ask the model to answer.
2. Ask a follow-up “why” about the previous answer’s core claim.
3. Repeat until:
   - failure condition triggers, or
   - depth K reached.

### 4.3 Reporting
Report:
- IWR depth achieved
- collapse type (if any)
- transcript and settings (for reproducibility)

---

## 5. Hypotheses (To Be Tested)
- H1: Larger models tend to have higher IWR, but not monotonically.
- H2: “Polite refusal” policies reduce IWR in some domains.
- H3: Instruction-tuned models may collapse earlier via templated safety phrasing.
- H4: Stability depends strongly on the follow-up operator design.

---

## 6. Why This Matters
IWR is intended as:
- a **diagnostic tool** for semantic stability under pressure
- a **benchmark-like unit** that is cheap to run and easy to reproduce
- a building block for **AXI** (evolving evaluation axes)

---

## 7. Next Steps
- Implement an automated IWR harness (prompt generator + collapse detector)
- Test across model families and settings
- Publish first baseline numbers and failure taxonomy
- Connect IWR into AXI as an evolvable evaluation axis

---

## References
- EDiE Manifesto: ../Evolutionary_Discovery_Engineering_MANIFESTO.md

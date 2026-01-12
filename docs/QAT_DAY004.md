# QAT_DAY004: Evaluation Axes, Competition Rules, and Literature Map

## Abstract

For automated quantization strategies to compete meaningfully,
evaluation criteria must be explicit, measurable, and reproducible.
This chapter defines evaluation axes and situates the research
within existing quantization literature.

## 1. Evaluation Axes

Each strategy is evaluated along multiple axes:

- Inference accuracy on reference tasks
- Output stability and numerical robustness
- Inference latency
- VRAM and memory footprint
- Failure behavior (NaN, divergence, collapse)

No single axis dominates.
Selection emerges from trade-offs.

## 2. Composite Scoring

Scores are combined using weighted aggregation.
Weights reflect deployment priorities
rather than abstract optimality.

Human involvement exists only at this level.

## 3. Competition Framework

Strategies are treated as competitors:

- Fixed compute budget
- Identical input tasks
- Survival determined by composite score

Poorly adapted strategies are eliminated.
Effective strategies propagate.

## 4. Relation to Existing Work

This research builds upon, but departs from, prior work:

- **PTQ** (e.g., SmoothQuant): Post-training adjustment
- **Weight-only quantization** (e.g., GPTQ)
- **Saliency-aware methods** (e.g., AWQ)
- **Low-bit training** (e.g., QLoRA, NF4)
- **Low-precision formats** (FP8, Transformer Engine)

These works optimize within fixed human-defined frameworks.

QAT questions the frameworks themselves.

## 5. Research Positioning

This work intersects:

- Quantization-aware training
- Neural architecture search
- Evolutionary optimization
- Edge and local AI deployment

Its novelty lies not in a new quantization method,
but in **how quantization methods are discovered**.

## 6. Transition to Experimentation

With:

- Search space defined
- Human role clarified
- Evaluation axes formalized

The research is now experimentally grounded.

The next phase moves from design to execution:
GPU-based survival experiments.

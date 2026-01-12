# QAT_DAY002: Quantization Strategy as a Search Space

## Abstract

To study quantization as a primary research target, it must be made searchable.
In this chapter, I formalize quantization strategies as elements of a structured search space,
enabling automated generation, mutation, and selection.

## 1. From Technique to Representation

Human-designed quantization methods implicitly embed assumptions:
fixed bit-widths, layer-wise heuristics, and manually chosen scaling rules.

To remove these assumptions, quantization must be represented explicitly,
not as code paths, but as **parameterized structures**.

## 2. Strategy as an Individual

I define a *quantization strategy* as a single individual consisting of:

- Layer-wise bit-width assignments
- Scaling and normalization rules
- Activation and weight quantization modes
- Outlier handling mechanisms
- Approximate arithmetic choices

Each strategy represents a complete, executable quantization policy.

## 3. Search Space Design

The search space is constrained but expressive:

- Constraints prevent numerical collapse or invalid inference
- Expressiveness allows non-uniform, non-intuitive configurations

The goal is not exhaustive coverage,
but to enable **emergent structure discovery**.

## 4. Generation Methods (Initial)

Initial population generation follows two principles:

- Avoid total randomness that breaks computation
- Avoid human-crafted heuristics beyond minimal validity

Generation methods include:

- Random sampling under constraints
- Structured randomization with controlled entropy

## 5. Mutation and Variation

Strategies evolve through mutations such as:

- Bit-width perturbation
- Layer role swapping
- Scaling function replacement
- Outlier policy toggling

These mutations are intentionally blind to human interpretability.

## 6. Why Search Matters

By defining quantization as a search space:

- The problem becomes algorithmically tractable
- Human bias is minimized
- Performance boundaries can be explored systematically

This transforms quantization from an art into an evolutionary process.

## 7. Transition

With strategies represented and generatable,
the next question becomes unavoidable:

**Who decides which strategies are valuable?**

That question defines the role of humans in this research.

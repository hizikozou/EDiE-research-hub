# EDiE-research-hub  
## Evolutionary Discovery Engineering (EDiE)

## Manifesto

- [Evolutionary Discovery Engineering (EDiE) Manifesto](Evolutionary_Discovery_Engineering_MANIFESTO.md)

---

## Overview

This repository is the **central research hub for Evolutionary Discovery Engineering (EDiE)**.

Evolutionary Discovery Engineering is an engineering paradigm in which:
- Solutions are not directly designed by humans.
- Environments, constraints, and evaluation rules are designed instead.
- Algorithms and structures are **discovered through evolution and competition**.
- Humans retain responsibility for **determining value**, not for enforcing interpretability.

This repository collects concrete research programs, experiments, and logs
that operationalize EDiE as a practical research methodology.

---

## Core Research Programs

The research conducted under EDiE currently proceeds along three complementary routes:

### **QAT — Quantization as Survival Strategy**
Quantization is treated not as a post-processing optimization trick,
but as a **primary survival mechanism for AI under constrained resources**.

Rather than hand-designing quantization rules, QAT explores:
- Automated generation of quantization strategies
- Competition and selection among strategies
- Survival-based evaluation independent of human interpretability

QAT currently serves as the **primary theoretical and experimental backbone**
of this repository.

---

### **MIN — Minimum Intelligence under Constraints**
MIN focuses on identifying:
- Boundary conditions where AI behavior collapses
- Failure modes on minimal hardware and compute budgets
- The minimum requirements for intelligence-like behavior to emerge

Experiments span microcontrollers, edge devices, and severely constrained systems.

---

### **R-Cubie — Embodied Edge AI Experiments**
R-Cubie is a hands-on experimental hardware series exploring:
- Physical embodiment of edge AI
- Playful but rigorous experimentation
- Human-perceptible demonstrations of minimal intelligence

R-Cubie serves as the **embodied, demonstrative counterpart** to QAT and MIN.

---

## Research Focus of This Repository

While EDiE encompasses all three programs,
this repository currently focuses primarily on **QAT**.

QAT provides the clearest testbed for validating the core hypothesis of EDiE:
that meaningful algorithms can be discovered through survival dynamics,
even when humans cannot fully explain or predict them.

---

## Research Logs (QAT)

Each chapter is written as a standalone research log,
structured similarly to sections of an academic paper.

- **[QAT_DAY001](docs/QAT_DAY001.md)**  
  Auto-generated quantization as a primary research target

- **[QAT_DAY002](docs/QAT_DAY002.md)**  
  Quantization strategies as a searchable space

- **[QAT_DAY003](docs/QAT_DAY003.md)**  
  The irreducible role of humans in value selection

- **[QAT_DAY004](docs/QAT_DAY004.md)**  
  Evaluation axes, competition rules, and literature map

- **[QAT_DAY005](docs/QAT_DAY005.md)**  
  Executable roadmap for auto-generated quantization survival experiments  
  (from environment setup to strategy tournaments)

Together, these logs correspond roughly to the
*problem definition, methodology, and positioning* sections of a research paper.

---

## Current Status

- Phase: **Pre-experimental design**
- Next step: **GPU-based survival experiments**
  - Initial platform: RTX 5060 Ti
  - Goal: fully automated generation, competition, and evaluation of strategies

---

## Why This Matters

Edge AI, local LLMs, and MicroAI systems face a shared bottleneck:

> Human-designed assumptions embedded too deeply into system design.

EDiE explores whether removing just **one additional layer of human bias**
— even at the cost of interpretability —
can shift the practical performance boundary of AI systems.

This question applies across domains, from microcontrollers to autonomous systems.

---

## Related Writing (Japanese)

Background thoughts, informal exploration, and parallel logs are written in Japanese:

- https://myon.hatenadiary.com/

This GitHub repository serves as the **canonical, world-facing research record**.  
The blog acts as a companion space for reflection and narrative context.

---

## License

To be determined.

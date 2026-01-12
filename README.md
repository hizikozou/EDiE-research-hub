# QAT-research-hub  
**Auto-generated Quantization as Survival Strategy (QAT)**

This repository documents an ongoing research project that treats **quantization not as a post-processing trick**,  
but as a **primary research target and survival mechanism for AI under constrained resources**.

The core question is simple but radical:

> *What if quantization rules themselves were generated, competed, and selected —  
> even if humans cannot fully interpret them?*

---

## Motivation

Most quantization research focuses on optimization within human-designed frameworks:

- Reduce bit-width  
- Preserve accuracy  
- Follow interpretable heuristics  

This project deliberately questions those assumptions.

Instead of designing quantization rules by hand,  
I design **the rules under which quantization strategies survive**.

---

## Research Structure

This research proceeds along three clearly separated but complementary routes:

- **QAT**  
  Define competition rules and extract **AI survival strategies** through automated search and selection.

- **MIN**  
  Observe failure modes and boundary behavior of AI systems on real hardware  
  (microcontrollers, edge devices, minimal compute).

- **RCB**  
  Hands-on experimental hardware diary (R-Cubie series),  
  focusing on physical realization and playful exploration.

This repository focuses primarily on **QAT**.

---

## Research Logs (QAT)

Each chapter is written as a standalone research log, following a paper-like structure.

- **[QAT_DAY001](docs/QAT_DAY001.md)**  
  Auto-generated quantization as a primary research target

- **[QAT_DAY002](docs/QAT_DAY002.md)**  
  Quantization strategies as a searchable space

- **[QAT_DAY003](docs/QAT_DAY003.md)**  
  The irreducible role of humans in value selection

- **[QAT_DAY004](docs/QAT_DAY004.md)**  
  Evaluation axes, competition rules, and literature map

- **[QAT_DAY005](docs/QAT_DAY005.md)**: Executable roadmap for auto-generated quantization survival experiments  
  (Concrete milestones from environment setup to strategy tournaments)

These chapters correspond roughly to the *problem definition, methodology, and positioning* sections of a research paper.

---

## Current Status

- Phase: **Pre-experimental design**
- Next step: **GPU-based survival experiments**  
  (initially on RTX 5060 Ti, full automated evaluation)

---

## Why This Matters

Edge AI, local LLMs, and MicroAI systems all face the same bottleneck:

> *Human-designed assumptions embedded too deeply into system design.*

This research explores whether removing just **one more layer of human bias**  
can shift the practical performance boundary of AI systems.

---

## Related Writing (Japanese)

For readers interested in background thoughts, informal logs, and parallel exploration,  
I also write in Japanese here:

- https://myon.hatenadiary.com/

The GitHub repository is intended as the **canonical, world-facing research record**.  
The blog serves as a more free-form companion.

---

## License

To be determined.

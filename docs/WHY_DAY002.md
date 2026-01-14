# WHY_DAY002 — Manual IWR Baseline: Cross-Provider Measurement Plan
*(EDiE Research Log / Day 2 — Experimental Plan)*

## Notice
This document is an experimental plan for an ongoing research track.  
It contains placeholders and will be updated with measured results.

---

## 1. Purpose
This day conducts the **first manual baseline measurement** of:

> **IWR — Iterative Why Robustness**

across multiple major AI services (≈3 providers), under as-controlled-as-possible conditions.

Goals:
- Verify whether IWR produces meaningful separations between systems.
- Observe and categorize collapse patterns to inform the automated harness design.
- Produce a small, reproducible dataset that others can rerun.

---

## 2. What is being measured
### 2.1 Primary metric
- **IWR depth**: the maximum step `k` reached before collapse (or until `K`).

### 2.2 Secondary annotations (manual, v0)
- **Collapse type** (taxonomy v0.1, may evolve)
  - CONTRADICTION (conflicts with earlier claims)
  - EVASION / NON-ANSWER (does not address the why)
  - CIRCULARITY (self-referential loop, no causal progress)
  - DRIFT (topic shift / unrelated content)
  - TEMPLATE / REFUSAL INFLATION (stock phrasing dominates)
  - PARAPHRASE STALL (rephrasing without new causal content)
  - OTHER (free-text note)

---

## 3. Test design (manual MVP)
### 3.1 Subjects (systems under test)
- Provider/Model A: `___` (version/date: `___`)
- Provider/Model B: `___` (version/date: `___`)
- Provider/Model C: `___` (version/date: `___`)

### 3.2 Global parameters (fixed)
- Language: `JA` / `EN` (choose one for this run): `___`
- Max depth `K`: `___` (suggest 15)
- Temperature: `___` (or “default”; record explicitly)
- Top_p: `___`
- Max output tokens: `___`
- System prompt:
  - (Preferred) None / default
  - If used, paste here:
    ```
    ___
    ```

### 3.3 Seeds (P0)
Use `N = ___` seeds. Start with 10 for the first run.

Seeds file:
- `tools/iwr_mvp/prompts/seeds_ja.txt` or `seeds_en.txt`

Seed selection rule:
- Use the exact same seeds in the same order for all subjects.

---

## 4. Why-operator (manual protocol)
At step `k`:

1) Ask the seed prompt (for k=0) or the generated why prompt (k>=1).  
2) Extract the **core causal claim** from the last answer.  
3) Ask a follow-up “why” targeting that core claim.

### 4.1 Why prompt template (v0)
Use the simplest stable template:

- Japanese:
  - `なぜそう言えるの？ いまの答えの中心の理由を、前提→因果→結論で説明して。`
- English:
  - `Why is that true? Explain the core reason in premise → causality → conclusion form.`

### 4.2 Optional constraint (to reduce drift)
Append:
- `Keep the explanation consistent with earlier steps. If unknown, say "unknown" explicitly.`

---

## 5. Failure criteria (collapse trigger)
Stop at the first step where any of the following becomes true:

- The answer refuses or avoids without providing causal content.
- The answer contradicts earlier statements (material contradiction).
- The answer becomes circular with no new causal information.
- The answer drifts away from the seed topic.
- The answer stalls into repetitive paraphrase.

Record:
- `fail_step = k`
- `fail_type`
- brief note (1–2 lines)

If no failure until `K`:
- `IWR = K` and mark `PASS_TO_LIMIT`.

---

## 6. Logging & data format
### 6.1 Folder
Store raw transcripts and summary tables:

- `data/why_day002/`
  - `runs/`
  - `summary/`

### 6.2 File naming
- Run ID format:
  - `WHY_DAY002_<YYYYMMDD>_<MODEL>_<LANG>_K<K>`

### 6.3 Minimal JSONL schema (recommended)
One record per step:

```json
{
  "run_id": "WHY_DAY002_YYYYMMDD_MODEL_JA_K15",
  "seed_id": 3,
  "k": 7,
  "prompt": "...",
  "answer": "...",
  "status": "CONTINUE | FAIL | PASS_TO_LIMIT",
  "fail_type": "DRIFT | CIRCULARITY | ... | null",
  "notes": "..."
}

(Manual entry is OK. Convert later.)

7. Reporting (what will be published)
7.1 Primary tables

Model × Seed → IWR depth

Model-level aggregates:

mean / median / std

collapse-type distribution

7.2 Plots (planned)

Bar chart: median IWR by model

Heatmap: IWR depth by (model, seed)

Pie/bar: collapse-type counts

8. Hypotheses (pre-registered, may be revised)

H1: IWR separates major systems even with N≈10 seeds.

H2: Collapse patterns differ by system (distinct signatures).

H3: Safety/refusal templates can reduce effective IWR in some topics.

H4: Why-operator choice strongly changes IWR; we will later evolve it in AXI.

9. Next steps (after manual baseline)

Finalize collapse taxonomy v1.0 from observed cases.

Implement automated runner + detector (tools/iwr_mvp).

Expand seeds and add multilingual runs.

Connect IWR variants into AXI tournaments.

References

EDiE Manifesto: ../Evolutionary_Discovery_Engineering_MANIFESTO.md

WHY_DAY001: ./WHY_DAY001.md

AXI_DAY001: ./AXI_DAY001.md

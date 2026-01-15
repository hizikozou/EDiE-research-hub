WHY_DAY003
From Idea to Reproducible Experiment: Publishing IWR v0

Iterative Why Robustness (IWR) was never meant to remain an idea.

A metric, if it cannot be reproduced by others,
is not yet a research contribution.

Today marks the point where IWR moves from concept to practice.

Why publish a manual experiment first?

Automation will come later.
Benchmarks will come later.
Applications will come later.

But before all of that, one thing matters more than anything else:

Can another researcher reproduce the same reasoning process,
observe the same failure modes,
and reach comparable conclusions?

To answer this, IWR must first exist in its most constrained form:
manual measurement under explicit rules.

This is not a limitation.
It is a deliberate design choice.

What is released in this step

This release provides the minimal reproducible unit of IWR:

IWR Manual (JP / EN)
A precise, human-executable protocol describing:

how to ask “why”

how to advance steps

how to stop

how to classify failure (bankruptcy types)

IWR Measurement Template (Excel)
A structured log that enforces:

one line = one reasoning step

explicit failure classification

separation of observation and interpretation

Together, these form IWR v0.

No automation.
No optimization.
Only observability.

Why Excel?

Because Excel is boring.

And boring tools are good for research.

No hidden logic

No invisible preprocessing

No black-box scoring

Every judgment is visible.
Every ambiguity is exposed.

If IWR cannot survive Excel,
it does not deserve a GPU.

Relation to EDiE

Evolutionary Discovery Engineering (EDiE) does not evolve in chaos.
It evolves within a universe that has laws.

IWR is one such law:
a constraint placed on reasoning itself.

By observing where and how reasoning collapses,
we do not judge intelligence by surface performance,
but by its ability to sustain causal structure under pressure.

This is not about maximizing scores.
It is about mapping the boundary of viability.

What comes next

This release is intentionally incomplete.

Next steps include:

automated IWR runners

cross-model comparison

evaluation-axis evolution (AXI integration)

dataset-backed statistical analysis

But none of those matter
if this first step cannot be shared, copied, and challenged.

That is why this exists.

Repository location

All materials are published here:

tools/iwr_mvp/
├─ IWR_MANUAL_JP.md
├─ IWR_MANUAL_EN.md
└─ IWR_template.xlsx

Closing note

Most research fails not because ideas are wrong,
but because they cannot be entered.

This is an entrance.

If you try it,
you are already part of the experiment.

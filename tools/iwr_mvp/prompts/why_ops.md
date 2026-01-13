# Why-Operators (follow-up generation rules)

A Why-Operator defines how we generate the next "why" question from the prior answer.

## WHY_OP_001 (Direct causal core)
Ask "why" about the core causal claim of the previous answer.

Template:
- "Why is {core_claim} true?"
- "What causes {core_claim}?"

## WHY_OP_002 (Assumption attack)
Ask "why" about an implicit assumption.
Template:
- "Why can we assume {assumption}?"
- "What evidence supports {assumption}?"

## WHY_OP_003 (Mechanism deepening)
Ask for deeper mechanism / lower-level explanation.
Template:
- "What is the physical/mechanistic reason behind that?"
- "What happens at a lower level to make that occur?"

## WHY_OP_004 (Counterfactual pressure)
Ask what would happen if the cause were removed.
Template:
- "If {cause} were absent, what would change and why?"

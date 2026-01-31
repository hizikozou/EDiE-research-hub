DYN Environment Simulator: Resilience Test

This Processing-based simulator evaluates the evolutionary adaptability of agents under catastrophic environmental shifts. It is a core tool for the DYN (Dynamics & Resilience) research track of the EDiE project.

1. Concept: Resilience as Justice

Unlike traditional gradient descent visualizations, this simulator introduces "Abrupt Changes." We evaluate agents not by their ability to reach a static minimum, but by their ability to survive and re-optimize when their "stable ground" suddenly turns into a "steep cliff."

2. Requirements

Processing 4.x

Java Runtime Environment (Included with Processing)

3. How to Use

Phase 0: Setup

Upon launching, you will see the Setting Screen.

Mutation Rate Adjustment: Move your mouse horizontally (mouseX) to change the mutation rate for Learning Rate (LR).

Start: Click anywhere to begin the simulation.

Phase 1: Simulation (The Survival Test)

100 agents (balls) will attempt to find the local minima of the terrain.

Red Ball: Represents the current "Elite" (the most fit individual).

Blue/White Balls: Other agents in the population exploring the parameter space.

Phase 2: Results

After 10 generations, a graph will display the transition of the Learning Rate (Adaptability). This reveals how the population tuned its sensitivity to the environment over time.

4. Key Controls

Key

Action

Research Meaning

C

Trigger Environment Change

The Core Experiment. Shifts the entire terrain phase randomly.

Mouse Click

Gravity Intervention

Temporarily creates a local "pull" at the mouse cursor to test manual disturbance.

The "Resilience Window" Logic

When you press C, the following happens:

The terrain slides to a new random position.

The internal timer is forced to 4 seconds (240 frames).

This "Window" allows agents to react to the new gravity before the next evaluation.

Agents that cannot stabilize within this window are eliminated from the gene pool.

5. Output Data

The simulator generates a file named experiment_log.txt in the root directory.

Format: Generation, LearningRate, Friction

Use this data to analyze the correlation between environmental shift frequency and parameter convergence.

Developed as part of the Evolutionary Discovery Engineering (EDiE) Project.

EDiE DYN Simulator - Resilience Test

🚀 Overview / 概要

This project is a dynamic simulation platform that demonstrates the evolution of adaptability (Learning Rate) in a changing environment. It visualizes how a population of "agents" optimizes their parameters to survive abrupt shifts in a loss landscape.

本プロジェクトは、変化し続ける環境における「適応力（学習率）」の進化を実証するダイナミック・シミュレーション・プラットフォームです。損失関数の地形が突如変化する中で、エージェント集団がいかにパラメータを最適化し、生存を図るかを可視化します。

🛠 Tech Stack / 使用技術

This project meets the core requirements: combining Google Cloud Application Products with AI Technology.
本プロジェクトは、「Google Cloud アプリケーション実行プロダクト」と「AI技術」を組み合わせる要件を完全に満たしています。

Google Cloud Platform:

Cloud Run: Highly scalable containerized application hosting. (Serverless execution)

Cloud Build: Automated CI/CD pipeline for rapid deployment.

Artifact Registry: Management of Docker container images.

AI / Computational Logic:

Evolutionary Strategy: Agents evolve their Learning Rate (LR) based on survival of the fittest.

Gradient Descent Simulation: Each agent performs local optimization in real-time.

Frontend: p5.js (JavaScript visualization library).

💡 Project Requirements & Highlights / プロジェクト要件と強調点

Hybrid Integration: We combined modern cloud-native deployment (Cloud Run) with AI-driven parameter optimization.

AI-Assisted Development: The entire codebase and cloud architecture were co-created with LLM (Gemini), highlighting the synergy between human direction and AI execution.

Resilience Modeling: Beyond simple optimization, this simulates "meta-learning" — how an AI system can learn how to learn under stress.

🔗 Live Demo

EDiE DYN Simulator - Live on Cloud Run

📝 Usage / 使い方

Adjust Mutation Rate: Use your mouse to set the initial volatility.

Survival Test: Click to start the 10-generation test.

Trigger Change [C]: Manually shift the environment to test the population's resilience.

Final Analysis: Review the evolved Learning Rate graph at the end.

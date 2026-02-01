EDiE DYN - Cloud Deployment Suite

This directory contains the necessary artifacts to deploy the EDiE DYN Simulator to a cloud environment, specifically optimized for Google Cloud Run.

This suite represents the "Biological Machinery" required to express the simulation's genetic code in a scalable, cloud-native ecosystem.

🧬 Architecture of the "Nucleus"

To make the evolutionary simulation accessible via a web browser, we wrap the p5.js-based "intelligence" in a lightweight containerized environment. This structure ensures that the simulation (The Genome) can be replicated consistently across any infrastructure.

index.html: The core simulation logic (The Genome). It contains the evolutionary strategies and the p5.js visual engine.

server.py: A minimal Python-based web server (The Ribosome). It reads the genetic information and serves it to the external world.

Dockerfile: The blueprint that defines the container's environment (The Cell Membrane). It protects and sustains the internal logic.

deploy.sh: A utility script to trigger the replication and deployment process to Cloud Run (The Expression Catalyst).

🚀 How to Deploy

Ensure you have the Google Cloud SDK installed or use the Google Cloud Shell.

Navigate to this directory:

cd tools/dyn_env_sim/cloud


Execute the deployment script:

bash deploy.sh


Access the living instance:
Once the command completes, it will provide a Service URL (e.g., https://edie-dyn-sim-xxxx.a.run.app/).

🛠 Technical Specifications

Runtime: Python 3.9-slim (Minimal footprint for high efficiency).

Container Port: 8080 (Optimized for Google Cloud Run standard).

Frontend: p5.js + Tailwind CSS, delivering a professional, responsive, and data-rich UI.

Infrastructure: Fully Serverless, enabling the simulation to scale horizontally based on demand.

⚖️ Research Context: Resilience as Justice

This deployment is not merely a technical hosting exercise. It is an implementation of the EDiE (Evolutionary Discovery Engineering) philosophy. By deploying to the cloud, we test the "Resilience" of our algorithms in a production-grade environment, proving that adaptability is the highest form of intelligence in a shifting digital landscape.

Part of the EDiE (Evolutionary Discovery Engineering) Project.
Track: DYN (Dynamics & Resilience)

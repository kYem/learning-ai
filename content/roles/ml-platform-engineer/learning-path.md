# Learning Path: ML Platform Engineer

**Timeline:** 4-6 weeks focused study, then start applying
**Your skill match today:** ~65%
**London salary range:** £100-140K (senior), £140K+ with LLM expertise
**Demand trend:** Very high, growing 6.2% YoY

---

## Why This Role Fits You

An ML Platform Engineer builds the infrastructure that ML teams use — model registries, training pipelines, deployment automation, serving infrastructure, monitoring dashboards. It's the same type of work you've been doing for a decade (CI/CD, Kubernetes, cloud infra, API design), repointed at ML workloads.

You don't need to design neural architectures. You need to understand ML workflows well enough to build reliable platforms around them.

**What you already have that's directly transferable:**
- Kubernetes orchestration (GPU scheduling is the hard version of what you already know)
- Docker + containerisation (ML models ship as containers)
- AWS/GCP cloud infrastructure (SageMaker, Vertex AI are your new territory)
- CI/CD pipeline design (ML pipelines are CI/CD with data and models)
- API design at scale (model serving is an API problem)
- Monitoring and observability (model monitoring adds drift detection to what you know)
- Team leadership and cross-functional collaboration

---

## Phase 1: ML Fundamentals — Just Enough (Week 1)

**Goal:** Understand what ML engineers do well enough to build platforms for them. You're not becoming an ML engineer — you're becoming the person who makes ML engineers productive.

### What to learn:
- **The ML lifecycle:** data ingestion → feature engineering → training → evaluation → deployment → monitoring → retraining. Understand this loop cold. Every platform you build serves this loop.
- **Key ML concepts (breadth, not depth):** supervised vs unsupervised, training vs inference, overfitting, hyperparameters, epochs, batch size. You need the vocabulary, not the math.
- **What LLMs are:** transformer architecture at a high level (the cheat sheet you already have covers this). Understand inference vs fine-tuning, what a model artifact looks like, why models are large.
- **Model formats:** safetensors, ONNX, GGUF — what they are and when they're used.

### Resources:
- **Chip Huyen — "Designing Machine Learning Systems"** (the book) — This is your primary text. Written for engineers, not researchers. Covers the entire ML lifecycle from a systems perspective. Read chapters 1-4 and 9-11 in week 1.
- **Google's ML Crash Course** (developers.google.com/machine-learning) — Free, fast overview of ML concepts. Skip the math, focus on the concepts and pipeline sections.
- Your existing AI Engineer cheat sheet for LLM-specific vocabulary.

### You're done when:
You can explain the ML lifecycle end-to-end, you know what a feature store does, and you understand why model deployment is harder than deploying a web app (model size, GPU requirements, versioning, drift).

---

## Phase 2: ML Infrastructure Stack (Weeks 2-3)

**Goal:** Get hands-on with the tools ML platform engineers actually use daily.

### Core tools to learn:

**Model Serving (pick one to go deep on):**
- **KServe** (on Kubernetes) — The standard for serving ML models on K8s. You already know K8s, so this is a natural extension. Supports canary rollouts, autoscaling, multi-model serving.
- **vLLM** — Specifically for LLM inference. Learn to deploy it, configure tensor parallelism, set up the OpenAI-compatible API.
- **Triton Inference Server** (NVIDIA) — Production-grade, supports multiple frameworks. More complex but widely used.

**ML Pipeline Orchestration:**
- **Kubeflow Pipelines** — ML pipelines on Kubernetes. Directly builds on your K8s knowledge.
- **MLflow** — Experiment tracking, model registry, deployment. The "Git for models." Start here — it's the most common tool and easiest to learn.
- **Weights & Biases** — Experiment tracking and monitoring. Widely used, free tier available.

**Feature Stores:**
- **Feast** — Open-source feature store. Understand the concept: a centralised store for feature transformations so training and inference use the same features. You don't need to become an expert, just understand the architecture.

**Infrastructure as Code for ML:**
- **Terraform** for GPU instances and cloud ML services
- **Helm charts** for K8s ML deployments
- **Pulumi** (you could use TypeScript here — differentiator over Python-only candidates)

### Hands-on projects:

1. **Deploy MLflow** on a cloud instance. Register a model, track experiments, deploy a model to a REST endpoint. This takes 2-3 hours and gives you a complete picture of model lifecycle management.

2. **Deploy vLLM on Kubernetes.** Write the Helm chart or K8s manifests. Configure GPU resource requests, health checks, autoscaling based on GPU utilisation. Set up Prometheus metrics export and a Grafana dashboard. This project directly demonstrates your value — most ML engineers can't do this well.

3. **Build a simple ML CI/CD pipeline.** When a model is pushed to the registry → run evaluation benchmarks → if they pass → deploy to staging → run smoke tests → promote to production. Use GitHub Actions or your preferred CI tool. This is your bread and butter repackaged for ML.

### You're done when:
You have a running K8s cluster with vLLM serving a model, MLflow tracking experiments, Prometheus/Grafana monitoring GPU utilisation and model latency, and a CI/CD pipeline that deploys new model versions.

---

## Phase 3: ML-Specific Depth (Week 4)

**Goal:** Learn the ML-specific concerns that differentiate an ML platform from a regular platform.

### What to learn:

**Model Monitoring & Drift Detection:**
- Data drift: input distribution changes over time (e.g., user behaviour shifts)
- Model drift: prediction quality degrades without the model changing
- Concept drift: the relationship between inputs and outputs changes
- Tools: Evidently AI (open-source monitoring), Prometheus + custom metrics
- Why this matters: ML models degrade silently. Unlike a web app that crashes loudly, a model can return confident but wrong answers. Your monitoring must catch this.

**GPU Resource Management:**
- NVIDIA GPU operator for Kubernetes
- Multi-Instance GPU (MIG) — splitting one A100 into smaller partitions
- GPU scheduling: topology-aware scheduling, node affinity, device plugins
- Cost optimisation: spot instances for training, right-sizing GPU types, scale-to-zero

**Model Versioning & A/B Testing:**
- How to run two model versions simultaneously and route traffic between them
- Canary deployments for models (same concept as web apps, different metrics)
- Shadow mode: run new model alongside old, compare outputs without serving new model's results

**Evaluation Pipelines:**
- Automated benchmarking on model registration
- Regression detection (new model is worse than old on specific metrics)
- LLM-specific evaluation: using LLM-as-judge, human eval frameworks

### You're done when:
You can design a model monitoring system on a whiteboard — what metrics to track, how to detect drift, how to trigger retraining. You understand MIG and GPU scheduling on K8s.

---

## Phase 4: Interview Preparation (Weeks 5-6)

### Your Narrative

> "I've spent 10+ years building production platforms at scale — CI/CD pipelines, Kubernetes orchestration, cloud infrastructure, monitoring systems. Over the past few months I've specifically focused on ML platform engineering: deploying model serving infrastructure with vLLM and KServe, building ML CI/CD pipelines, and implementing GPU-aware monitoring and autoscaling. I bring the reliability engineering and platform thinking that ML teams desperately need."

### System Design Questions to Prepare:

1. **"Design a model serving platform."** Cover: model registry → deployment pipeline → serving layer (vLLM/Triton) → load balancer → autoscaler → monitoring. Your K8s knowledge shines here.

2. **"Design an ML monitoring system."** Cover: data drift detection, model performance metrics, GPU utilisation, alerting thresholds, automated retraining triggers. Your observability experience is directly applicable.

3. **"Design a feature store."** Cover: offline (batch) vs online (real-time) feature serving, consistency between training and inference, storage choices, API design.

4. **"How would you handle GPU scheduling for a multi-tenant ML platform?"** Cover: K8s device plugins, MIG, priority queues, preemption, cost allocation per team.

### Portfolio Projects (have these on GitHub):

1. **K8s ML Platform Starter** — Helm charts for vLLM + MLflow + Prometheus/Grafana on K8s. Well-documented, production-ready configs. This is the project that gets you hired.

2. **ML CI/CD Pipeline** — GitHub Actions workflow: model registered → evaluate → deploy to staging → promote. Include rollback logic.

3. **GPU Monitoring Dashboard** — Grafana dashboard showing GPU utilisation, memory, temperature, inference latency, throughput, and model drift metrics.

### Companies to Target (London):

Bloomberg, Revolut, Monzo, Deliveroo, Wise, Meta, Google, Microsoft, Anthropic, Stability AI, and startups on the London AI scene. Also look for "Platform Engineer" roles at companies using ML heavily — they often don't have "ML" in the title but the work is the same.

---

## Key Tools Summary

| Category | Tools | Your Familiarity |
|---|---|---|
| Container orchestration | Kubernetes, Helm, Docker | **Already know** |
| Cloud | AWS (SageMaker, EKS), GCP (Vertex AI, GKE) | **Already know** (need ML service specifics) |
| CI/CD | GitHub Actions, ArgoCD, Jenkins | **Already know** |
| IaC | Terraform, Pulumi (TypeScript!) | **Already know** |
| Model serving | vLLM, KServe, Triton | **Learn** |
| Experiment tracking | MLflow, W&B | **Learn** |
| Monitoring | Prometheus, Grafana, Evidently AI | **Already know** (add ML metrics) |
| Pipeline orchestration | Kubeflow, Airflow | **Learn** (concepts familiar) |
| GPU management | NVIDIA GPU Operator, MIG, nvidia-smi | **Learn** |

Notice how much of this you already know. The "learn" column is smaller than the "already know" column.

---

## Realistic Timeline

| Week | Focus | Hours |
|---|---|---|
| 1 | ML fundamentals + Chip Huyen book | 15 |
| 2 | MLflow + vLLM deployment on K8s | 15 |
| 3 | ML CI/CD pipeline + monitoring | 15 |
| 4 | ML-specific depth (drift, GPU mgmt) | 12 |
| 5-6 | Portfolio polish + interview prep | 10/week |
| **Total** | | **~75 hours** |

GPU rental budget: ~£20-30 total (short GPU sessions for vLLM deployment testing).

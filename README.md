# Cloud-Native Application Deployment on AWS ECS Fargate

This repository showcases the design, deployment, and operation of a cloud-native containerized application on **AWS ECS Fargate** using **Terraform** and an automated **CI/CD pipeline powered by GitHub Actions**.

The project applies Infrastructure as Code (IaC) principles to provision scalable, secure, and repeatable AWS infrastructure. A Dockerized Node.js/Flask application is built and pushed to Amazon ECR, then automatically deployed to ECS Fargate whenever changes are pushed to the main branch.

## 🚀 Key Features

* Cloud-native architecture using AWS ECS Fargate
* Infrastructure provisioning with Terraform
* Docker-based containerization
* Automated CI/CD pipeline with GitHub Actions
* Secure AWS authentication using GitHub OIDC or Secrets
* Amazon ECR for container image storage
* IAM roles and security groups following best practices
* Optional Application Load Balancer for traffic management
* CloudWatch logging and health checks

## 🏗️ Architecture Overview

* Virtual Private Cloud (VPC) with public subnets
* ECS Fargate cluster
* ECS task definitions and services
* Amazon Elastic Container Registry (ECR)
* IAM roles and policies
* Security groups
* Application Load Balancer (optional)

## 🔄 CI/CD Workflow

1. Code is pushed to the `main` branch
2. GitHub Actions pipeline is triggered
3. Docker image is built and tagged
4. Image is pushed to Amazon ECR
5. ECS task definition is updated with the new image
6. ECS service deploys the new task revision
7. Deployment waits until service stability is achieved

## 📁 Repository Structure

```
.
├── app.py               # Application source code
├── Dockerfile           # Docker image configuration
├── requirements.txt     # Essential packages
├── webui/               # Contain the app UI
├── static/              # Contain the external assets for the Flask app UI
├── terraform/           # Terraform infrastructure files
├── .github/workflows/   # CI/CD pipeline configuration
└── README.md
```

## CI/CD Pipeline

CI/CD pipeline shows how code moves from idea to running app. Developers save changes, tools test files, build programs, check quality, then release updates fast, safe, often, without manual work, reducing mistakes, improving teamwork, delivering value smoothly clearly reliably continuously.

## 🌐 Purpose

This repository demonstrates modern DevOps and cloud engineering practices, including container orchestration, infrastructure automation, secure deployment pipelines, and scalable application operations on AWS.

It is designed to reflect real-world, production-oriented cloud deployments.

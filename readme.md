# TrendStore - EKS CI/CD Deployment Project

## Project Overview

TrendStore is a containerized static e-commerce application deployed on Amazon EKS using a complete CI/CD pipeline powered by Jenkins.

This project demonstrates:

* Docker containerization
* Kubernetes deployments on Amazon EKS
* Jenkins CI/CD automation
* Infrastructure orchestration
* Kubernetes service exposure
* Monitoring and observability basics
* Production-style DevOps workflow

---

# Architecture

```text
Developer Pushes Code
          |
          v
      GitHub Repository
          |
          v
        Jenkins
   (CI/CD Pipeline)
          |
          +
          |                   
          v                  
   Build Docker Image    
          |
          v
   Push Image to AWS ECR
          |
          v
      Amazon EKS Cluster
          |
          v
   Kubernetes Deployment
          |
          v
      TrendStore App
```

---

# Technologies Used

* AWS EKS
* Kubernetes
* Docker
* Jenkins
* AWS ECR
* GitHub
* Linux
* kubectl
* YAML
* Nginx

---

# Features

* Containerized static application
* Automated CI/CD pipeline
* Kubernetes-based deployment
* Scalable architecture
* Declarative infrastructure
* Automated image builds
* Rolling deployments
* Production-style workflow

---

# Prerequisites

Before starting:

* AWS Account
* EKS Cluster
* kubectl configured
* AWS CLI configured
* Jenkins server
* Docker installed
* IAM permissions for EKS
* GitHub repository

---



# Jenkins CI/CD Pipeline

The Jenkins pipeline automates:

1. Pull latest code from GitHub
2. Build Docker image
3. Push image to Docker Hub
4. Deploy application to EKS using Helm




# Deployment Workflow

* The EC2 instance & AWS EKS is to be provisioned using terraform. The relevant ports are opened for future access in the security group's TF code itself.
* The application is then dockerized locally to test the application functionality. The Dockerfile is used to create the image.
* AWS ECR repository is created to store the built iamge pushed from the pipeline.
* Jenkinsfile is created with appropriate stages to build and deploy the application using helm. Jenkins Webhook is configured for the GitHub repository.
* Jenkins & Docker is installed on the EC2. Jenkins mulitbranch pipeline is created with branch source as GitHub and proper script path is configure in the pipeline. 
* These files are pushed to GitHub repo. A new dev branch is created. The pipeline is triggered by the push event and the pipeline is successfully executed. The DockerHub dev repo received the pushed image. 
* On EC2, the container is up & running. The public IP is accessed on port 80 to access the application.
* The dev branch is merged with the main branch. The pipeline is again triggered by the push event and executed successfully. The prod repo received the pushed image and a docker container spun up on the EC2 machine.
* The docker-compose file is created for pulling and running the Prometheus & Grafana image. Prometheus' yaml file is configured to scrape metrics periodically. 
* The docker-compose file is pulled from the GitHub repo and deployed to EC2 manually. The Prometheus data source is configured. A node-exporter dashboard is imported in Grafana
* The public IP with respective ports is accessed to access Prometheus & Grafana dashboards. The system metrics including CPU & memory utilization can be now monitored.
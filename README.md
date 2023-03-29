# Deploying HAProxy On Kubernetes

HAProxy is an open-source load balancer that can help manage traffic and improve application performance. Kubernetes is a container orchestration platform that simplifies the deployment and scaling of containerized applications. By leveraging the benefits of both technologies, we were able to build a scalable and highly available load balancing solution.


# Getting Started
Before you can deploy the application, you need to have the following tools installed:
- Docker
- Minikube
- Kubernetes CLI (kubectl)

# Installation
- Clone this repository to your local machine.
- Navigate to the project directory.
- Run the `deploy.sh` script to deploy the application. The script will create Kubernetes resources.
- To clean up the deployment, run the `cleanup.sh` script. The script will delete all Kubernetes resources created by the deploy.sh script.

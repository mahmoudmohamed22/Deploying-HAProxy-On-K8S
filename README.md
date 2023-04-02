# Deploying HAProxy On Kubernetes

HAProxy is an open-source load balancer that can help manage traffic and improve application performance. Kubernetes is a container orchestration platform that simplifies the deployment and scaling of containerized applications. By leveraging the benefits of both technologies, we were able to build a scalable and highly available load balancing solution.



![1_VDiosV8gD1f-8Hx6sJscFg](https://user-images.githubusercontent.com/47304558/229368363-e11a4d6c-57a6-4a56-9a95-1bedafa750b4.png)


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

# k8s Resources
- Created a namespace haproxy-controller-devops.
- Created a ServiceAccount haproxy-service-account-devops under the same namespace.
- Created a ClusterRole which is named haproxy-cluster-role-devops, to grant permissions "get", "list", "watch", "create", "patch", "update" to "Configmaps", "secrets", "endpoints", "nodes", "pods", "services", "namespaces", "events", "serviceaccounts".
- Created a ClusterRoleBinding which is named haproxy-cluster-role-binding-devops under the same namespace. Defined roleRef apiGroup as rbac.authorization.k8s.io, kind as ClusterRole, name as haproxy-cluster-role-devops and subjects kind as ServiceAccount, name as haproxy-service-account-devops, and namespace as haproxy-controller-devops.
- Created a backend deployment named backend-deployment-devops under the same namespace, with labels run as ingress-default-backend under metadata. Spec is configured with a replica of 1, selectors' matchLabels run as ingress-default-backend. Template's labels run under metadata are ingress-default-backend. The container is named as backend-container-devops and uses the image gcr.io/google_containers/defaultbackend:1.0, and its containerPort is 8080.
- Created a service for the backend named service-backend-devops under the same namespace, with labels run as ingress-default-backend. Spec is configured with selector's run as ingress-default-backend, port named as port-backend, protocol as TCP, port as 8080, and targetPort as 8080.
- Created a deployment for the frontend named haproxy-ingress-devops under the same namespace. Spec is configured with a replica of 1, selectors' matchLabels as haproxy-ingress, template's labels run as haproxy-ingress under metadata. The container name is ingress-container-devops under the same service account haproxy-service-account-devops, using the image haproxytech/kubernetes-ingress. Args are given as --default-backend-service=haproxy-controller-devops/service-backend-devops, resources requests for CPU as 500m and for memory as 50Mi. LivenessProbe httpGet path is /healthz and its port is 1024. The first port name is http, with its containerPort as 80, the second port name is https, with its containerPort as 443, and the third port name is stat, with its containerPort as 1024. Environment is defined as the first env name being TZ and its value as Etc/UTC, the second env name being POD_NAME and its valueFrom is fieldRef with fieldPath as metadata.name, and the third env name being POD_NAMESPACE and its valueFrom is fieldRef with fieldPath as metadata.namespace.
- Created a service for the frontend named ingress-service-devops under the same namespace, with labels run as haproxy-ingress. Spec is configured with selectors' run as haproxy-ingress, type as NodePort. The first port name is http, with its port as 80, protocol as TCP, targetPort as 80, and nodePort as 32456. The second port name is https, with its port as 443, protocol as TCP, targetPort as 443, and nodePort as 32567. The third port name is stat,

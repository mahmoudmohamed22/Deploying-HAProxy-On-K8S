# haproxy-k8s


HAProxy (High Availability Proxy) is a TCP/HTTP load balancer and proxy server that allows a webserver to spread incoming requests across multiple 
endpoints. This is useful in cases where too many concurrent connections over-saturate the capability of a single server. 
Instead of a client connecting to a single server which processes all the requests,
the client will connect to an HAProxy instance, which will use a reverse proxy to forward the request to one of the available endpoints, 
based on a load-balancing algorithm.

HAProxy is an open-source load balancer that can help manage traffic and improve application performance. Kubernetes is a container orchestration platform that simplifies the deployment and scaling of containerized applications. By leveraging the benefits of both technologies, we were able to build a scalable and highly available load balancing solution.

## Prerequisites
Before you begin, make sure you have the following installed:

- Kubectl
- Minikube


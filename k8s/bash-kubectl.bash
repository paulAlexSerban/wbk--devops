#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function create_service_hello_node() {
    echo "Creating a sample deployment and exposing it on port 8080"
    kubectl create deployment hello-node --image=kicbase/echo-server:1.0
}

function get_k8s_deployemnt() {
    echo "Getting the list of deployments"
    kubectl get deployment
}

function get_k8s_services() {
    echo "Getting the list of services"
    kubectl get service
}

function get_k8s_pods() {
    echo "Getting the list of pods"
    kubectl get pods
}

function get_k8s_nodes() {
    echo "Getting the list of nodes"
    kubectl get nodes
}

function get_k8s_config() {
    echo "Getting the list of configmaps"
    kubectl get configmaps
}

function expose_service_hello_node() {
    echo "Exposing the deployment on port 8080"
    kubectl expose deployment hello-node --type=NodePort --port=8080
}

function get_service_hello_node() {
    echo "Getting the service URL"
    minikube service hello-node --url
}

function use_kubectl_to_forward_port() {
    echo "Using kubectl to forward port 8080 to 8080"
    kubectl port-forward service/hello-node 7080:8080
    echo "Now you can access the service on localhost:7080"
}

function delete_hello_node() {
    echo "Deleting the hello-node deployment"
    kubectl delete deployment hello-node
    echo "The hello-node deployment is deleted"
} 

function get_k8s_namespace() {
    echo "Getting the list of namespaces"
    kubectl get namespaces
}

function specify_namespace() {
    echo "Specifying the namespace"
    # kubectl get pods --namespace=<NAMESPACE_NAME>
    kubectl get pods --namespace=kube-system
}

function create_namespace() {
    echo "Creating a new namespace"
    # kubectl create namespace <NAMESPACE_NAME>
    kubectl create namespace my-namespace
}

function get_all_namespaces() {
    echo "Getting all namespaces"
    # kubectl get namespaces
    kubectl get pods --all-namespaces
}

function create_namespace() {
    echo "Creating a new namespace"
    # kubectl create namespace <NAMESPACE_NAME>
    kubectl create namespace my-namespace
}
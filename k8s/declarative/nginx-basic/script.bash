#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

function apply_dry() {
    kubectl apply -f nginx.yaml --dry-run=server
}

function apply() {
    kubectl apply -f nginx.yaml
}

function diff() {
    kubectl diff -f nginx.yaml
}

function delete() {
    kubectl delete -f nginx.yaml
}

$1
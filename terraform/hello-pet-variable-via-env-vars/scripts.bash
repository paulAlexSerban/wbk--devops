#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

export TF_VAR_filename="pet.txt"
export TF_VAR_content="Hello, env pet!"
export TF_VAR_prefix="Mrs"
export TF_VAR_separator="."
export TF_VAR_length=1

function init() {
    # this command will download the provider plugin
    terraform init
}

function plan() {
    # this command will show the changes that will be applied
    terraform plan
}

function apply() {
    # this command will apply the changes
    terraform apply \
        -auto-approve 
}

function destroy() {
    # this command will destroy the resources
    terraform destroy -auto-approve
}

$1
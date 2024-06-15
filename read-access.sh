#!/bin/bash

API_URL = "https://api.github.com" # this is the base url

USERNAME=$username
TOKEN=$token

REPO_OWNER=$1
REPO_NAME=$2

helper()

function github_api_get{
    local endpoint = "$1"
    local url ="${API_URL}/${endpoint}"

    curl -s -u "${USERNAME}:${TOKEN}" "url"
}

function list_users_with_read_access{
    local endpoint = "repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    local collaborators = "$(github_api_get "endpoint" | jq -r '.[]|select(.permissions.pull==true)|.login')"

    if [[-z "$collaborators"]];then
	    echo "No users with read access to ${REPO_OWNER}/${REPO_NAME}"
    else
	    echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}"
	    echo "$collaborators"
    fi
}

function helper{
expected_cmd_args=2
if [$# -ne expected_cmd_args]; then
	echo "Execute the script with required command line arguments"
fi
}

echo "Listing users with read access: "
list_users_with_read_access

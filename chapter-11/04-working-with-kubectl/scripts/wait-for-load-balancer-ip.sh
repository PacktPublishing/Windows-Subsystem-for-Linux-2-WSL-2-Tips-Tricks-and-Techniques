#!/bin/bash
set -e

while true; do
    ipAddress=$(kubectl get service chapter-11-04 -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
    # alternative using jq
    # ipAddress=$(kubectl get service chapter-11-04 -o json | jq -r '.status.loadBalancer.ingress[0].ip')

    if [[ $ipAddress == "null" ]]; then
        # no record yet - nothing to do
        echo "waiting..."
    else
        # existing record - delete it
        echo -e "Found IP Address: $ipAddress\nTry 'curl http://$ipAddress'"
        exit 0
    fi
    sleep 0.5s
done
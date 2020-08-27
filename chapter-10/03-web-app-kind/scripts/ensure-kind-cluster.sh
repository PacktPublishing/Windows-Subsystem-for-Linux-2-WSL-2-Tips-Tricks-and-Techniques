#!/bin/bash

CLUSTER_NAME=chapter-10-03

if [[ $(kind get clusters | grep -q ${CLUSTER_NAME}; echo $?) != 0 ]]; then
	kind create cluster --name ${CLUSTER_NAME}
fi

echo 'export KUBECONFIG="$(kind get kubeconfig-path --name="chapter-10-03")"'

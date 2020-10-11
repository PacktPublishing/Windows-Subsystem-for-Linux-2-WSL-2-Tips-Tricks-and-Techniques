# README

This is a sample code to accompany chapter 11, Productivity Tips with Command Line Tools.

This sample creates an AKS cluster and deploys a simple nginx app.

## Create the cluster

Create a resource group and AKS cluster, and then download the credentials to access via `kbuectl`:
```bash
az group create \
       --name wsltips-chapter-11-04 \
       --location westeurope

az aks create \
       --resource-group wsltips-chapter-11-04 \
       --name wsltips \
       --generate-ssh-keys \
       --node-count 2

az aks get-credentials \
       --resource-group wsltips-chapter-11-04 \
       --name wsltips 
```

## Deploy the nginx app

To deploy the nginx sample app:
```bash
kubectl apply -f manifests
```

To view the deployed service

```bash
kubectl get services chapter-11-04 -o json
```

To query for the service external IP address (also see `scripts/wait-for-load-balancer.sh`):
```bash
kubectl get service chapter-11-04 \
      -o jsonpath="{.status.loadBalancer.ingress[0].ip}"
```

## Scaling the app

To view the current pods:
```bash
kubectl get pods -l app=chapter-11-04
```

Scale the app to 3 replicas:
```bash
kubectl scale deployment chapter-11-04 --replicas=3
```

Check the pod status:
```bash
kubectl get pods -l app=chapter-11-04
```

For the pod that is stuck in Pending (change the pod name in the command below):
```bash
kubectl get pod chapter-11-04-f4965d6c4-dptkt -o json
```

Querying pod information:
```bash
# Get pod names and status conditions
kubectl get pods -o json | \
    jq '.items[] | {name: .metadata.name, conditions: .status.conditions}'

# Get pod names and status conditions for non-scheduled pods
kubectl get pods -o json | \
    jq '.items[] | {name: .metadata.name, conditions: .status.conditions[] | select(.type == "PodScheduled" and .status == "False")}'

# Get pod names and status conditions for non-scheduled pods in simple output format
kubectl get pods -o json | \
  jq '[.items[] | {name: .metadata.name, conditions: .status.conditions[] | select(.type == "PodScheduled" and .status == "False")} | {name, reason: .conditions.reason, message: .conditions.message}]'

# Create k-unschedulable alias
alias k-unschedulable="kubectl get pods -o json |   jq '[.items[] | {name: .metadata.name, conditions: .status.conditions[] | select(.type == \"PodScheduled\" and .status == \"False\")} | {name, reason: .conditions.reason, message: .conditions.message}]'"

```

## Delete the cluster

To delete the cluster:
```bash
az group delete --name wsltips-chapter-11-04
```
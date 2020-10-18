# README

This sample shows how to work with Docker Desktop Kubernetes for "Working with Kubernetes in dev containers" in Chapter 10.

To run:

* Ensure the Docker Desktop Kubernetes integration is enabled and running
* Open the folder in VS Code as a dev container
* In the integrated terminal, run `make build-docker` build the app image
* run `kubectl apply -f manifests` to deploy the app into the cluster
* run `kubectl port-forward service/chapter-10-example 5000` to forward a local port to the app service in Kubernetes


# README

This sample contains the completed changes for "Working with Kubernetes in dev containers" in Chapter 10.

To run:

* Open the folder in VS Code as a dev container
* In the integrated terminal, run `make kind-load-image` to set up the kind cluster, build the app image and load it into the cluster
* run `kubectl apply -f manifests` to deploy the app into the cluster
* run `kubectl port-forward service/chapter-10-example 5000` to forward a local port to the app service in Kubernetes




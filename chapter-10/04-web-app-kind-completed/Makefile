CLUSTER_NAME?=chapter-10-04

.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m: %s\n", $$1, $$2}'

run: ## run locally
	gunicorn --bind 0.0.0.0:5000 app:app

build-docker: ## build docker image
	docker build -t simple-python-app-2:v1 -f Dockerfile .

ensure-kind-cluster: ## ensure that the kind cluster is created
	kind create cluster --name ${CLUSTER_NAME}
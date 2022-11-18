CURRENT_DIR = $(shell pwd)
TOPO_NAME ?= ceostopo1

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clab_deploy
clab_deploy: ## Deploy ceos lab
	sudo containerlab deploy --topo $(TOPO_NAME).clab.yml
	$(CURRENT_DIR)/./host_l3_config/l3_build.sh

.PHONY: clab_save
clab_save: ## Save ceos lab config
	sudo containerlab save --topo $(TOPO_NAME).clab.yml

.PHONY: clab_destroy
clab_destroy: ## Destroy ceos lab
	sudo containerlab destroy --topo $(TOPO_NAME).clab.yml

.PHONY: clab_rm
clab_rm: ## Destroy ceos lab and remove files
	sudo containerlab destroy --topo $(TOPO_NAME).clab.yml --cleanup

.PHONY: clab_graph
clab_graph: ## Build lab graph
	sudo containerlab graph --topo $(TOPO_NAME).clab.yml

.PHONY: clab_inspect
clab_inspect: ## Build lab graph
	sudo containerlab inspect --topo $(TOPO_NAME).clab.yml

.PHONY: cvp_onboard
onboard: ## onboard devices to CVP
	python3 $(CURRENT_DIR)/onboard_devices_to_cvp.py

.PHONY: host l3 config
clab_host_l3: ## onboard devices to CVP
	$(CURRENT_DIR)/./host_l3_config/l3_build.sh



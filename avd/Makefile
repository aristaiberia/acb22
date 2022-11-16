CURRENT_DIR = $(shell pwd)

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: avd_build_config
avd_build_config: ## build configs only
	ansible-playbook playbooks/build-configs.yml

.PHONY: avd_build_eapi
avd_build_eapi: ## build configs and configure switches via eAPI
	ansible-playbook playbooks/fabric-deploy-eapi.yml

.PHONY: avd_build_cvp
avd_build_cvp: ## build configs and configure switches via CVP
	ansible-playbook playbooks/fabric-deploy-cvp.yml

.PHONY: avd_validate
avd_validate: ## validate states
	ansible-playbook playbooks/validate-states.yml

.PHONY: avd_snapshot
avd_snapshot: ## take snapshot
	ansible-playbook playbooks/snapshot.yml

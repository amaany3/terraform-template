.DEFAULT_GOAl: terraform.plan.dev
SHELL=/bin/bash
ENV=develop
COMMAND=""
KMS_KEY_NAME=projects/project/locations/asia-northeast1/keyRings/sops/cryptoKeys/sops-key

#############################
# command
#############################
.PHONY: _terraform.init
_terraform.init:
	@TF_DATA_DIR=environments/${ENV}/.terraform terraform init -upgrade -backend-config environments/${ENV}/backend.tfvars

.PHONY: _terraform.plan
_terraform.plan:
	@TF_DATA_DIR=environments/${ENV}/.terraform terraform plan -var-file=environments/${ENV}/terraform.tfvars

.PHONY: _terraform.apply
_terraform.apply:
	@TF_DATA_DIR=environments/${ENV}/.terraform terraform apply -var-file=environments/${ENV}/terraform.tfvars

#############################
# init
#############################
.PHONY: terraform.init.dev
terraform.init.dev:
	@make _terraform.init ENV=develop

.PHONY: terraform.init.stg
terraform.init.stg:
	@make _terraform.init ENV=staging

.PHONY: terraform.init.prd
terraform.init.prd:
	@make _terraform.init ENV=production

#############################
# plan
#############################
.PHONY: terraform.plan.dev
terraform.plan.dev:
	@make _terraform.plan ENV=develop

.PHONY: terraform.plan.stg
terraform.plan.stg:
	@make _terraform.plan ENV=staging

.PHONY: terraform.plan.prd
terraform.plan.prd:
	@make _terraform.plan ENV=production

#############################
# apply
#############################
.PHONY: terraform.apply.dev
terraform.apply.dev:
	@make _terraform.apply ENV=develop

.PHONY: terraform.apply.stg
terraform.apply.stg:
	@make _terraform.apply ENV=staging

.PHONY: terraform.apply.prd
terraform.apply.prd:
	@make _terraform.apply ENV=production

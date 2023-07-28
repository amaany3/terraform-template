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

.PHONY: _terraform.sops.encrypt
_terraform.sops.encrypt:
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/${ENV}/secrets.yaml > environments/${ENV}/encrypted_secrets.yaml

.PHONY: _terraform.sops.decrypt
_terraform.sops.decrypt:
	@sops --decrypt environments/${ENV}/encrypted_secrets.yaml > environments/${ENV}/secrets.yaml

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

#############################
# sops encrypt
#############################
.PHONY: terraform.sops.encrypt.all
terraform.sops.encrypt.all:
	@make _terraform.sops.encrypt ENV=develop
	@make _terraform.sops.encrypt ENV=staging
	@make _terraform.sops.encrypt ENV=production

.PHONY: terraform.sops.encrypt.dev
terraform.sops.encrypt.dev:
	@make _terraform.sops.encrypt ENV=develop

.PHONY: terraform.sops.encrypt.stg
terraform.sops.encrypt.stg:
	@make _terraform.sops.encrypt ENV=staging

.PHONY: terraform.sops.encrypt.prd
terraform.sops.encrypt.prd:
	@make _terraform.sops.encrypt ENV=production

#############################
# sops decrypt
#############################
.PHONY: terraform.sops.decrypt.all
terraform.sops.decrypt.all:
	@make _terraform.sops.decrypt ENV=develop
	@make _terraform.sops.decrypt ENV=staging
	@make _terraform.sops.decrypt ENV=production

.PHONY: terraform.sops.decrypt.dev
terraform.sops.decrypt.dev:
	@make _terraform.sops.decrypt ENV=develop

.PHONY: terraform.sops.decrypt.stg
terraform.sops.decrypt.stg:
	@make _terraform.sops.decrypt ENV=staging

.PHONY: terraform.sops.decrypt.prd
terraform.sops.decrypt.prd:
	@make _terraform.sops.decrypt ENV=production

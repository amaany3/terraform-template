.DEFAULT_GOAl: terraform.plan.dev
SHELL=/bin/bash
ENV=develop
COMMAND=""
KMS_KEY_NAME=projects/xxx/locations/asia-northeast1/keyRings/sops/cryptoKeys/sops-key

#############################
# command
#############################
.PHONY: terraform.command
terraform.command:
	@TF_DATA_DIR=environments/${ENV}/.terraform terraform ${COMMAND}

#############################
# init
#############################
.PHONY: terraform.init.dev
terraform.init.dev:
	@make terraform.command ENV=develop COMMAND="init -upgrade -backend-config environments/develop/backend.tfvars"

.PHONY: terraform.init.stg
terraform.init.stg:
	@make terraform.command ENV=staging COMMAND="init -upgrade -backend-config environments/staging/backend.tfvars"

.PHONY: terraform.init.prd
terraform.init.prd:
	@make terraform.command ENV=production COMMAND="init -upgrade -backend-config environments/production/backend.tfvars"

#############################
# plan
#############################
.PHONY: terraform.plan.dev
terraform.plan.dev:
	@make terraform.command ENV=develop COMMAND="plan -var-file=environments/develop/terraform.tfvars"

.PHONY: terraform.plan.stg
terraform.plan.stg:
	@make terraform.command ENV=staging COMMAND="plan -var-file=environments/staging/terraform.tfvars"

.PHONY: terraform.plan.prd
terraform.plan.prd:
	@make terraform.command ENV=production COMMAND="plan -var-file=environments/production/terraform.tfvars"

#############################
# apply
#############################
.PHONY: terraform.apply.dev
terraform.apply.dev:
	@make terraform.command ENV=develop COMMAND="apply -var-file=environments/develop/terraform.tfvars"

.PHONY: terraform.apply.stg
terraform.apply.stg:
	@make terraform.command ENV=staging COMMAND="apply -var-file=environments/staging/terraform.tfvars"

.PHONY: terraform.apply.prd
terraform.apply.prd:
	@make terraform.command ENV=production COMMAND="apply -var-file=environments/production/terraform.tfvars"

#############################
# sops encrypt
#############################
.PHONY: terraform.sops.encrypt.all
terraform.sops.encrypt.all:
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/develop/secrets.yaml > environments/develop/encrypted_secrets.yaml
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/staging/secrets.yaml > environments/staging/encrypted_secrets.yaml
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/production/secrets.yaml > environments/production/encrypted_secrets.yaml

.PHONY: terraform.sops.encrypt.dev
terraform.sops.encrypt.dev:
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/develop/secrets.yaml > environments/develop/encrypted_secrets.yaml

.PHONY: terraform.sops.encrypt.stg
terraform.sops.encrypt.stg:
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/staging/secrets.yaml > environments/staging/encrypted_secrets.yaml

.PHONY: terraform.sops.encrypt.prd
terraform.sops.encrypt.prd:
	@sops --encrypt --gcp-kms ${KMS_KEY_NAME} environments/production/secrets.yaml > environments/production/encrypted_secrets.yaml

#############################
# sops decrypt
#############################
.PHONY: terraform.sops.decrypt.all
terraform.sops.decrypt.all:
	@sops --decrypt environments/develop/encrypted_secrets.yaml > environments/develop/secrets.yaml
	@sops --decrypt environments/staging/encrypted_secrets.yaml > environments/staging/secrets.yaml
	@sops --decrypt environments/production/encrypted_secrets.yaml > environments/production/secrets.yaml

.PHONY: terraform.sops.decrypt.dev
terraform.sops.decrypt.dev:
	@sops --decrypt environments/develop/encrypted_secrets.yaml > environments/develop/secrets.yaml

.PHONY: terraform.sops.decrypt.stg
terraform.sops.decrypt.stg:
	@sops --decrypt environments/staging/encrypted_secrets.yaml > environments/staging/secrets.yaml

.PHONY: terraform.sops.decrypt.prd
terraform.sops.decrypt.prd:
	@sops --decrypt environments/production/encrypted_secrets.yaml > environments/production/secrets.yaml

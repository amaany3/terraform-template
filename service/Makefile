.DEFAULT_GOAl: terraform.plan.dev
ENV=develop
COMMAND=""

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
	@make terraform.command ENV=develop COMMAND="init -backend-config environments/develop/backend.tfvars"

.PHONY: terraform.init.stg
terraform.init.stg:
	@make terraform.command ENV=staging COMMAND="init -backend-config environments/staging/backend.tfvars"

.PHONY: terraform.init.prd
terraform.init.prd:
	@make terraform.command ENV=production COMMAND="init -backend-config environments/production/backend.tfvars"

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

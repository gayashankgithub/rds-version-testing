.PHONY: init-qa plan-qa apply-qa destroy-qa
PROJECT_NAME="test-rds-versioning"

# QA Terraform
init-qa:
	AWS_PROFILE="your-aws-acc" terraform init -backend-config="key=${PROJECT_NAME}/qa/state.tfstate" -backend-config="qa/backend.hcl"
plan-qa:
	AWS_PROFILE="your-aws-acc" terraform plan -no-color -var-file="qa/qa.tfvars"
apply-qa:
	AWS_PROFILE="your-aws-acc" terraform apply -no-color -var-file="qa/qa.tfvars"
destroy-qa:
	AWS_PROFILE="your-aws-acc" terraform destroy -no-color -var-file="qa/qa.tfvars"

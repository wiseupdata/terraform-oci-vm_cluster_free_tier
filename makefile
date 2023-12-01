# Define the files to be deleted
FILES := .terraform.lock.hcl .terraform terraform.tfstate terraform.tfstate.backup


# Rule to delete the files
clear:
	@clear
	@echo "Deleting files: $(FILES)"
	@rm -Rf $(FILES)


# Terraform deploy
apply:
	@clear
	@terraform init
	@terraform validate
	@terraform fmt --recursive
	@terraform apply --auto-approve

# Terraform check
plan:
	@clear
	@terraform init
	@terraform validate
	@terraform fmt --recursive
	@terraform plan

# Specify that 'delete' is a phony target (i.e., it doesn't represent a file)
.PHONY: clear apply plan
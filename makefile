# Define the files to be deleted
FILES := .terraform.lock.hcl .terraform terraform.tfstate terraform.tfstate.backup

# Rule to delete the files
clear:
	@clear
	@echo "Deleting files: $(FILES)"
	@rm -Rf $(FILES)

# Specify that 'delete' is a phony target (i.e., it doesn't represent a file)
.PHONY: clear
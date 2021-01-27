variable perimeter_account_name {
	description = "Perimeter Account Name"
	default = "Perimeter"
}

variable "automation_role_name" {
	default = "OrganizationAccountAccessRole"
	description = "The role used for executing automation commands in the environment."
	type = string
}

// the master account id.  this is required because the configuration will be run using credentials from a different account then assume a role in the master account.
variable master_account_id {
	type = string
	description = "Master Account Id"
}


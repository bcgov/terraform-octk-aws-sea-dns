terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  version = "~> 4.0"
  region  = "ca-central-1"
  alias   = "master"
}

provider "aws" {
  version = "~> 4.0"
  region  = "ca-central-1"
  alias   = "perimeter"

  assume_role {
    role_arn     = "arn:aws:iam::${local.security_account.id}:role/${var.automation_role_name}"
    session_name = "slz-terraform-automation"
  }
}

module "lz_info" {
  source = "github.com/BCDevOps/terraform-aws-sea-organization-info"
  providers = {
    aws = aws.master
  }
}

locals {
  core_accounts    = { for account in module.lz_info.core_accounts : account.name => account }
  security_account = local.core_accounts[var.perimeter_account_name]
}


resource "aws_route53_zone" "nimbus" {
  provider = aws.perimeter
  name     = "nimbus.cloud.gov.bc.ca"
}

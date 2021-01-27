terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "3.11.0"
		}
	}
}

provider "aws" {
	version = "~> 3.0"
	region = "ca-central-1"
	alias = "master"
}

provider "aws" {
	version = "~> 3.0"
	region = "ca-central-1"
	alias = "perimeter"

	assume_role {
		role_arn = "arn:aws:iam::${local.security_account.id}:role/${var.automation_role_name}"
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
	core_accounts = { for account in module.lz_info.core_accounts : account.name =>  account }
	security_account = local.core_accounts[var.perimeter_account_name]
}


resource "aws_route53_zone" "nimbus" {
	provider = aws.perimeter
	name = "nimbus.cloud.gov.bc.ca"
}

//@todo we probably want to create the project account zone and NS records as part of the account creation automation for team accounts
resource "aws_route53_zone" "tnfhhm-dev" {
	provider = aws.perimeter
	name = "tnfhhm-dev.nimbus.cloud.gov.bc.ca"

	tags = {
		Environment = "dev"
		Project = "tnfhhm"
	}
}

resource "aws_route53_record" "tnfhhm-dev-ns" {
	provider = aws.perimeter
	zone_id = aws_route53_zone.nimbus.zone_id
	name    = "tnfhhm-dev.nimbus.cloud.gov.bc.ca"
	type    = "NS"
	ttl     = "30"
	records = aws_route53_zone.tnfhhm-dev.name_servers
}

//@todo this should be created as part of an application's infrastructure
resource "aws_route53_record" "tnfhhm-dev-sample-app-cname" {
	provider = aws.perimeter
	zone_id = aws_route53_zone.tnfhhm-dev.zone_id
	name    = "ssp-sample.tnfhhm-dev.nimbus.cloud.gov.bc.ca"
	type    = "CNAME"
	ttl     = "30"
	// todo source this from a datasource
	records = ["Public-DevTest-perimeter-alb-36523785.ca-central-1.elb.amazonaws.com"]
}

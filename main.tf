module "lz_info" {
  source = "github.com/BCDevOps/terraform-aws-sea-organization-info"
  providers = {
    aws = aws.master-account
  }
}

locals {
  core_accounts    = { for account in module.lz_info.core_accounts : account.name => account }
  security_account = local.core_accounts[var.perimeter_account_name]
}


resource "aws_route53_zone" "nimbus" {
  provider = aws.Perimeter-account
  name     = "nimbus.cloud.gov.bc.ca"
}

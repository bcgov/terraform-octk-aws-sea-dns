terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~>4.0.0"
      configuration_aliases = [aws.master-account, aws.log-archive-account, aws.Perimeter-account, aws.security-account, aws.iam-security-account, aws.shared-services-account, aws.SharedNetwork-account, aws.Operations-account]
    }
  }
}

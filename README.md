# Terraform Module for AWS SEA DNS

## Project Status
- [x] Development
- [ ] Production/Maintenance

# Documentation
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.Perimeter-account"></a> [aws.Perimeter-account](#provider\_aws.Perimeter-account) | 5.57.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lz_info"></a> [lz\_info](#module\_lz\_info) | github.com/BCDevOps/terraform-aws-sea-organization-info | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.nimbus](https://registry.terraform.io/providers/hashicorp/aws/5.57.0/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_role_name"></a> [automation\_role\_name](#input\_automation\_role\_name) | The role used for executing automation commands in the environment. | `string` | `"OrganizationAccountAccessRole"` | no |
| <a name="input_master_account_id"></a> [master\_account\_id](#input\_master\_account\_id) | Master Account Id | `string` | n/a | yes |
| <a name="input_perimeter_account_name"></a> [perimeter\_account\_name](#input\_perimeter\_account\_name) | Perimeter Account Name | `string` | `"Perimeter"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nimbus_name_servers"></a> [nimbus\_name\_servers](#output\_nimbus\_name\_servers) | n/a |
<!-- END_TF_DOCS -->

# Getting Started
<!--- setup env vars, secrets, instructions... --->

# Getting Help or Reporting an Issue
<!--- Example below, modify accordingly --->
To report bugs/issues/feature requests, please file an [issue](../../issues).


# How to Contribute
<!--- Example below, modify accordingly --->
If you would like to contribute, please see our [CONTRIBUTING](./CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.


# License
<!--- Example below, modify accordingly --->
    Copyright 2018 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

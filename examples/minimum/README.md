[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-vpc-endpoints.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module example of minimum configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.13.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minimum_vpc_endpoints"></a> [minimum\_vpc\_endpoints](#module\_minimum\_vpc\_endpoints) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.s3_endpoint_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route_tables.vpc_route_tables](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_tables) | data source |
| [aws_vpc.supporting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_supporting_resources_name"></a> [supporting\_resources\_name](#input\_supporting\_resources\_name) | Name of the supporting resources | `string` | `"terraform-aws-vpc-endpoints"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The resource tags to be applied | `map(string)` | <pre>{<br>  "Department": "DevOps",<br>  "Environment": "example",<br>  "LayerId": "Example",<br>  "LayerName": "Example",<br>  "Owner": "Boldlink",<br>  "Project": "Examples",<br>  "user::CostCenter": "terraform-registry"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2023

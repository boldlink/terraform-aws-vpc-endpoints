[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-vpc-endpoints.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-vpc-endpoints/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)


# Terraform AWS VPC Endpoint Module

## Description

The Terraform AWS VPC Endpoint Module is meticulously designed to facilitate the streamlined creation of VPC endpoints within your AWS infrastructure. This module offers a specialized feature that stands out: the ability to automatically generate a dedicated security group for all Interface endpoints when the `create_endpoint_sg` variable is set to `true`.

### Advantages of Choosing this Module Over Standalone Resources
- **Simplicity and Ease of Use:** Designed with user-friendliness in mind, this module provides intuitive and straightforward examples that expedite your adoption process.
- **Resource Complexity Management:** This module abstracts away the complexity, enabling you to focus on the core functionality.
- **Rapid Deployment:** Harness the power of efficient automation – deploying your endpoints becomes a swift, hassle-free task.
- **Dynamic Endpoint Scalability:** The module's capacity to seamlessly generate multiple endpoints dynamically grants unparalleled flexibility and adaptability to evolving operational needs.

Examples available [`here`](./examples)

## Usage
**NOTE**: These examples use the latest version of this module

```hcl
module "minimum_vpc_endpoints" {
  source             = "./../../"
  vpc_id             = local.vpc_id
  tags               = var.tags

  vpc_endpoints = [
    {
      service_name        = "com.amazonaws.${local.region}.dynamodb"
      vpc_endpoint_type   = "Gateway"
      name                = "DynamoDB"
      route_table_ids     = flatten(local.route_table_ids)
      policy              = data.aws_iam_policy_document.ddb_endpoint_policy.json
    }
  ]
}
}
```
## Documentation

[Amazon VPC Endpoint Documentation](https://link)

[Terraform module documentation](https://link)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.allow_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_endpoint_sg"></a> [create\_endpoint\_sg](#input\_create\_endpoint\_sg) | Specify whether to create Security Group for Interface endpoints | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeouts config for the endpoints | `map(string)` | `{}` | no |
| <a name="input_vpc_endpoints"></a> [vpc\_endpoints](#input\_vpc\_endpoints) | Configuration lists for vpc endpoints | `any` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which the endpoint will be used. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the VPC endpoint. |
| <a name="output_cidr_blocks"></a> [cidr\_blocks](#output\_cidr\_blocks) | The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type `Gateway`. |
| <a name="output_dns_entry"></a> [dns\_entry](#output\_dns\_entry) | The DNS entries for the VPC Endpoint. Applicable for endpoints of type `Interface` |
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC endpoint |
| <a name="output_network_interface_ids"></a> [network\_interface\_ids](#output\_network\_interface\_ids) | One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type `Interface`. |
| <a name="output_owner_id"></a> [owner\_id](#output\_owner\_id) | The ID of the AWS account that owns the VPC endpoint. |
| <a name="output_prefix_list_id"></a> [prefix\_list\_id](#output\_prefix\_list\_id) | The prefix list ID of the exposed AWS service. Applicable for endpoints of type `Gateway`. |
| <a name="output_requester_managed"></a> [requester\_managed](#output\_requester\_managed) | Whether or not the VPC Endpoint is being managed by its service - `true` or `false`. |
| <a name="output_state"></a> [state](#output\_state) | The state of the VPC endpoint. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource |
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

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```
#### BOLDLink-SIG 2023

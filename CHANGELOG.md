# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Include GatewayLoadbalancer type to the complete example

## [1.0.2] - 2023-11-22
- fix: timeouts block parsing wrong units when module is used in others modules

## [1.0.1] - 2023-10-31
- fix: timeouts block to be more dynamic within the endpoints block
- feat: showcased usage of auto_accept
- feat: showcased usage of ip_address_type
- feat: showcased usage of dns_options

## [1.0.0] - 2023-08-11
### Description
- feat: First major release
- feat: added ability to create multiple endpoints dynamically
- feat: added security group for Interface endpoints which allows https traffic from within the VPC

## [0.1.0] - 2023-08-10
### Description
- feat: Initial code commit

[Unreleased]: https://github.com/boldlink/terraform-aws-vpc-endpoints/compare/1.0.2...HEAD

[1.0.2]: https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/tag/1.0.2
[1.0.1]: https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/tag/1.0.0
[0.1.0]: https://github.com/boldlink/terraform-aws-vpc-endpoints/releases/tag/0.1.0

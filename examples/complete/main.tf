module "comeplete_endpoints_example" {
  source             = "./../../"
  vpc_id             = local.vpc_id
  tags               = var.tags
  create_endpoint_sg = var.create_endpoint_sg

  vpc_endpoints = [
    {
      service_name        = "${local.reverse_dns_prefix}.${local.region}.ssm"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ssm"
      auto_accept         = true
      ip_address_type     = "ipv4"

      dns_options = [
        {
          dns_record_ip_type                             = "ipv4"
          private_dns_only_for_inbound_resolver_endpoint = false
        }
      ]

      timeouts = {
        create = "15m"
        update = "15m"
        delete = "15m"
      }
    },
    {
      service_name        = "${local.reverse_dns_prefix}.${local.region}.ec2messages"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ec2messages"
    },
    {
      service_name        = "${local.reverse_dns_prefix}.${local.region}.ssmmessages"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ssmmessages"
    },
    {
      service_name        = "${local.reverse_dns_prefix}.${local.region}.kms"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "kms"
    },
    {
      service_name      = "${local.reverse_dns_prefix}.${local.region}.dynamodb"
      vpc_endpoint_type = "Gateway"
      name              = "DynamoDB"
      route_table_ids   = flatten(local.route_table_ids)
      policy            = data.aws_iam_policy_document.ddb_endpoint_policy.json
    }
  ]
}

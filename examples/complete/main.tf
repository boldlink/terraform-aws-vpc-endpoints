module "comeplete_endpoints_example" {
  source             = "./../../"
  vpc_id             = local.vpc_id
  tags               = var.tags
  create_endpoint_sg = var.create_endpoint_sg

  vpc_endpoints = [
    {
      service_name        = "com.amazonaws.${local.region}.ssm"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ssm"
    },
    {
      service_name        = "com.amazonaws.${local.region}.ec2messages"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ec2messages"
    },
    {
      service_name        = "com.amazonaws.${local.region}.ssmmessages"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "ssmmessages"
    },
    {
      service_name        = "com.amazonaws.${local.region}.kms"
      private_dns_enabled = var.private_dns_enabled
      subnet_ids          = local.internal_subnets
      name                = "kms"
    },
    {
      service_name      = "com.amazonaws.${local.region}.dynamodb"
      vpc_endpoint_type = "Gateway"
      name              = "DynamoDB"
      route_table_ids   = flatten(local.route_table_ids)
      policy            = data.aws_iam_policy_document.ddb_endpoint_policy.json
    }
  ]
}

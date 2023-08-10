module "minimum_vpc_endpoints" {
  source = "./../../"
  vpc_id = local.vpc_id
  tags   = var.tags

  vpc_endpoints = [
    {
      service_name      = "com.amazonaws.${local.region}.dynamodb"
      vpc_endpoint_type = "Gateway"
      name              = "DynamoDB"
      route_table_ids   = flatten(local.route_table_ids)
      policy            = data.aws_iam_policy_document.ddb_endpoint_policy.json
    }
  ]
}

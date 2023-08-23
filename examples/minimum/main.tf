module "minimum_vpc_endpoints" {
  source = "./../../"
  vpc_id = local.vpc_id
  tags   = var.tags

  vpc_endpoints = [
    {
      service_name      = "${local.reverse_dns_prefix}.${local.region}.s3"
      vpc_endpoint_type = "Gateway"
      name              = "s3"
      route_table_ids   = flatten(local.route_table_ids)
      policy            = data.aws_iam_policy_document.s3_endpoint_policy.json
    }
  ]
}

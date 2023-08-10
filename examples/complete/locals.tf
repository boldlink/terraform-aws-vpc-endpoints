locals {
  internal_subnet_id = [
    for i in data.aws_subnet.internal : i.id
  ]

  internal_subnets = local.internal_subnet_id
  route_table_ids  = data.aws_route_tables.vpc_route_tables.ids
  region           = data.aws_region.current.name
  vpc_id           = data.aws_vpc.supporting.id
}

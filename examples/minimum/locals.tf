locals {
  route_table_ids    = data.aws_route_tables.vpc_route_tables.ids
  region             = data.aws_region.current.name
  reverse_dns_prefix = data.aws_partition.current.reverse_dns_prefix
  vpc_id             = data.aws_vpc.supporting.id
}

locals {
  route_table_ids = data.aws_route_tables.vpc_route_tables.ids
  region          = data.aws_region.current.name
  vpc_id          = data.aws_vpc.supporting.id
}

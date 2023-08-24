data "aws_region" "current" {}

data "aws_partition" "current" {}

data "aws_vpc" "supporting" {
  filter {
    name   = "tag:Name"
    values = [var.supporting_resources_name]
  }
}

data "aws_subnets" "internal" {
  filter {
    name   = "tag:Name"
    values = ["${var.supporting_resources_name}*.int.*"]
  }
}

data "aws_subnet" "internal" {
  for_each = toset(data.aws_subnets.internal.ids)
  id       = each.value
}

data "aws_iam_policy_document" "ddb_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["dynamodb:*"]
    resources = ["*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "StringNotEquals"
      variable = "aws:sourceVpc"

      values = [data.aws_vpc.supporting.id]
    }
  }
}

data "aws_route_tables" "vpc_route_tables" {
  vpc_id = data.aws_vpc.supporting.id
  filter {
    name   = "tag:Name"
    values = ["${var.supporting_resources_name}*.int.*"]
  }
}

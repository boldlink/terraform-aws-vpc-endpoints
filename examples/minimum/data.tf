data "aws_region" "current" {}

data "aws_partition" "current" {}

data "aws_vpc" "supporting" {
  filter {
    name   = "tag:Name"
    values = [var.supporting_resources_name]
  }
}

data "aws_iam_policy_document" "s3_endpoint_policy" {
  statement {
    effect    = "Deny"
    actions   = ["s3:*"]
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

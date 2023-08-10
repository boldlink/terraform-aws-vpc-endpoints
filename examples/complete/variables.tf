variable "supporting_resources_name" {
  type        = string
  description = "Name of the supporting resources"
  default     = "terraform-aws-vpc-endpoints"
}

variable "tags" {
  type        = map(string)
  description = "The resource tags to be applied"
  default = {
    Environment        = "example"
    "user::CostCenter" = "terraform-registry"
    Department         = "DevOps"
    Project            = "Examples"
    Owner              = "Boldlink"
    LayerName          = "Example"
    LayerId            = "Example"
  }
}

variable "private_dns_enabled" {
  type        = bool
  description = "Whether to enable private DNS. Applies only for `Interface` endpoints"
  default     = true
}

variable "create_endpoint_sg" {
  type        = bool
  description = "Whether to create the security group used by Interface endpoints"
  default     = true
}

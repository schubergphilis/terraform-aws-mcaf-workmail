variable "name" {
  type        = string
  description = "The FQDN for the directory service"
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key ID used for the SSM encryption"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnets of the VPC"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the bucket"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

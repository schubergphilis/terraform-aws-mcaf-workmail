provider "aws" {}

resource "aws_directory_service_directory" "default" {
  name     = var.name
  password = random_password.default.result
  size     = "Small"
  tags     = var.tags
  type     = "SimpleAD"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }
}

resource "random_password" "default" {
  length  = 16
  special = true
}

resource "aws_ssm_parameter" "default" {
  name   = "directoryservice/${var.name}/password"
  type   = "SecureString"
  value  = random_password.default.result
  key_id = var.kms_key_id
  tags   = var.tags
}

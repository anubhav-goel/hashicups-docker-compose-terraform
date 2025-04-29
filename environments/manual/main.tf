provider "aws" {
  region = "eu-north-1"
}

terraform {
  backend "s3" {
    bucket         = "my-hashicups-manual-tfstate"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "my-hashicups-manual-locks"
    encrypt        = true
  }
}

data "aws_vpc" "default" {
  default = true
}

module "hashicups" {
  source = "../../modules/hashicups"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  environment   = var.environment
  vpc_id        = data.aws_vpc.default.id
}
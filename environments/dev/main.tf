provider "aws" {
  region = "eu-north-1"
}

terraform {
  # backend "s3" {
  #   bucket         = "my-hashicups-dev-tfstate"
  #   key            = "terraform.tfstate"
  #   region         = "eu-north-1"
  #   dynamodb_table = "my-hashicups-dev-locks"
  #   encrypt        = true
  # }

  cloud {
    organization = "anubhav-learning"
    workspaces {
      name = "hashicups-docker-compose-terraform-dev"
    }
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

# resource "aws_s3_bucket" "new_bucket_test" {
#   bucket = "test-anubhav-29-04-2025-${var.environment}"
# }
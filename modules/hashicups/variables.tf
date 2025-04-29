variable "ami_id" {
  description = "AMI id for aws EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type (t3.micro etc)"
  type        = string
}


variable "environment" {
  description = "Deployment environment (dev/stage/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EC2 and SG will be created"
  type        = string
}
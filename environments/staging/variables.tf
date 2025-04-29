variable "ami_id" {
  description = "AMI ID for EC2"
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
resource "aws_security_group" "hashicups_sg" {
  name        = "hashicups-sg-${var.environment}"
  description = "Allow frontend HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow frontend HTTP traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "hashicups" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.hashicups_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "HashiCups-${var.environment}"
  }
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker git
              service docker start
              curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              git clone https://github.com/hashicorp-demoapp/hashicups-setups.git
              cd hashicups-setups/docker-compose-deployment
              docker-compose up -d
              EOF
}

resource "aws_s3_bucket" "new_bucket_test" {
  bucket = "test-anubhav-29-04-2025-${var.environment}"
}
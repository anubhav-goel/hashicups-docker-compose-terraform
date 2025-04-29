output "instance_public_ip" {
  description = "IP address of deployed EC2 application"
  value       = aws_instance.hashicups.public_ip
}
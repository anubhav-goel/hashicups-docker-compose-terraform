output "instance_public_ip" {
  description = "IP address of deployed EC2 application"
  value       = module.hashicups.instance_public_ip
}
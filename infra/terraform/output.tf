output "ec2_ip" {
  value       = aws_instance.this.public_ip
  description = "EC2 Public IP"
}
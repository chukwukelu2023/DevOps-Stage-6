aws_vpc_cidr_block       = "10.0.0.0/16"
aws_vpc_instance_latency = "default"
tags = {
  "environment" = "testing"
}
aws_subnet_cidr_block = "10.0.1.0/24"
gateway_cidr          = "0.0.0.0/0"
sg_name               = "allow_traffic"
sg_description        = "Allow TLS inbound traffic and all outbound traffic"
sg_rule = {
  sg_ssh = {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  sg_http = {
    type        = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  sg_https = {
    type        = "ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  sg_web = {
    type        = "ingress"
    from_port   = 8000
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  sg_out = {
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
ec2_instance_ami  = "ami-01fd6fa49060e89a6"
ec2_instance_type = "t3.medium"
associate_pub_ip  = true
resource "aws_vpc" "this" {
  cidr_block       = var.aws_vpc_cidr_block
  instance_tenancy = var.aws_vpc_instance_latency
  tags             = var.tags
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.aws_subnet_cidr_block
  tags       = var.tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = var.tags
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.gateway_cidr
    gateway_id = aws_internet_gateway.this.id
  }

  tags = var.tags
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = aws_vpc.this.id
  tags        = var.tags
}

resource "aws_security_group_rule" "this" {
  for_each          = var.sg_rule
  type              = each.value.type
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.this.id
}

resource "aws_instance" "this" {
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = var.associate_pub_ip
  vpc_security_group_ids      = [aws_security_group.this.id]
  key_name                    = aws_key_pair.ec2-key.key_name
  tags                        = var.tags
}
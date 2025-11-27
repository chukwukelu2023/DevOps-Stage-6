variable "aws_vpc_cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
}

variable "aws_vpc_instance_latency" {
  type        = string
  description = "(Optional) A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "aws_subnet_cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the subnet."
}

variable "gateway_cidr" {
  type        = string
  description = "(Required) The CIDR block of the route."
}

variable "sg_name" {
  type        = string
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name."
}

variable "sg_description" {
  type        = string
  description = "(Optional, Forces new resource) Security group description. Defaults to Managed by Terraform. Cannot be . NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags."
}

variable "sg_rule" {
  type = map(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ec2_instance_ami" {
  type        = string
  description = "(Optional) AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
}

variable "ec2_instance_type" {
  type        = string
  description = "(Optional) Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "associate_pub_ip" {
  type        = bool
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare api token"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
    # tls = {
    #   source  = "hashicorp/tls"
    #   version = "~> 4.0"
    # }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.13.0"
    }

  }
  backend "s3" {
    bucket = "devops-stage6"
    key    = "terraform/terraform.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  # Configuration options
  # region = var.region
  # access_key = var.aws_key
  # secret_key = var.aws_secret
  default_tags {
    tags = {
      track = "devops"
      stage = "six"
    }
  }
}


provider "cloudflare" {
  # api_token = var.cloudflare_api_token
}
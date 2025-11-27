terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.13.0"
    }

  }
}

provider "aws" {
  # Configuration options
  region = "eu-north-1"
  default_tags {
    tags = {
      track = "devops"
      stage = "six"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
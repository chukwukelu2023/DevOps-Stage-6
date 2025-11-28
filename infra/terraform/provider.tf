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
  backend "s3" {
    bucket     = "oluchicompute"
    key        = "compute/terraform.tfstate"
    region     = "eu-central-2"
    access_key = "*********************"
    secret_key = "*********************"
    endpoints = {
      s3 = "https://s3.eu-central-003.backblazeb2.com"
    }
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "aws" {
  # Configuration options
  region     = "eu-north-1"
  access_key = "********************"
  secret_key = "********************"
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
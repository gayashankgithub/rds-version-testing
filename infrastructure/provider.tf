terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.55.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.21.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"


  default_tags {
    tags = local.tags
  }
}

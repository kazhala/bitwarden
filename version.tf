terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }
  backend "s3" {
    bucket         = "kazhala-terraform-remote-backend"
    key            = "bitwarden"
    region         = "ap-southeast-2"
    dynamodb_table = "kazhala-terraform-remote-lock"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

provider "aws" {
  alias = "cloudfront"

  region  = "us-east-1"
  profile = var.profile
}

module "ses_smtp" {
  source = "github.com/kazhala/terraform-aws-ses-smtp-identity?ref=v0.1.0"

  tags = var.tags
}

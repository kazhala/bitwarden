locals {
  domain_name = "${var.domain_name_prefix}${var.domain_name_prefix != "" ? "." : ""}${var.domain_name}"
}

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

data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = false
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v3.0"

  domain_name               = local.domain_name
  zone_id                   = data.aws_route53_zone.this.zone_id
  subject_alternative_names = ["www.${local.domain_name}"]
  tags                      = var.tags

  providers = {
    aws = aws.cloudfront
  }
}

resource "random_id" "this" {
  byte_length = 48
}

module "vaultwarden" {
  source = "github.com/kazhala/terraform-aws-vaultwarden"

  domain_name             = var.domain_name
  domain_name_prefix      = var.domain_name_prefix
  name                    = "bitwarden"
  rds_db_name             = "bitwarden"
  rds_snapshot_identifier = var.rds_snapshot_identifier
  cloudfront_enable       = true
  cloudfront_acm_arn      = module.acm.acm_certificate_arn
  tags                    = var.tags

  vaultwarden_env = [
    {
      name  = "ADMIN_TOKEN"
      value = random_id.this.hex
    },
    {
      name  = "SIGNUPS_ALLOWED"
      value = "false"
    },
    {
      name  = "SMTP_HOST"
      value = module.ses_smtp.smtp_endpoint
    },
    {
      name  = "SMTP_FROM"
      value = var.invitation_email
    },
    {
      name  = "SMTP_PORT"
      value = module.ses_smtp.smtp_ports[1]
    },
    {
      name  = "SMTP_SSL"
      value = "true"
    },
    {
      name  = "SMTP_USERNAME"
      value = module.ses_smtp.smtp_username
    },
    {
      name  = "SMTP_PASSWORD"
      value = module.ses_smtp.smtp_password
    }
  ]
}

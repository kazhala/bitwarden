# bitwarden

Personal deployment of self-hosted [bitwarden](https://github.com/dani-garcia/bitwarden_rs) on AWS via Terraform leveraging AWS Free Tier.

## Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | terraform-aws-modules/acm/aws | ~> v3.0 |
| <a name="module_ses_smtp"></a> [ses\_smtp](#module\_ses\_smtp) | github.com/kazhala/terraform-aws-ses-smtp-identity?ref=v0.1.0 |  |
| <a name="module_vaultwarden"></a> [vaultwarden](#module\_vaultwarden) | github.com/kazhala/terraform-aws-vaultwarden |  |

## Resources

| Name | Type |
|------|------|
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name to use for SSL cert. | `string` | n/a | yes |
| <a name="input_domain_name_prefix"></a> [domain\_name\_prefix](#input\_domain\_name\_prefix) | Prefix to add to the domain name. | `string` | `""` | no |
| <a name="input_invitation_email"></a> [invitation\_email](#input\_invitation\_email) | Email to send invitation. | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS credential profile to use to deploy the infrastructure. | `string` | `"bitwarden"` | no |
| <a name="input_rds_snapshot_identifier"></a> [rds\_snapshot\_identifier](#input\_rds\_snapshot\_identifier) | Create RDS instance using the provided snapshot ID. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy the main infrastructure. | `string` | `"ap-southeast-2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional resource tags to apply to applicable resources. Format: {"key" = "value"} | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_token"></a> [admin\_token](#output\_admin\_token) | Token to login to admin page. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

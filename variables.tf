variable "region" {
  default     = "ap-southeast-2"
  type        = string
  description = "Region to deploy the main infrastructure."
}

variable "profile" {
  default     = "bitwarden"
  type        = string
  description = "AWS credential profile to use to deploy the infrastructure."
}

variable "domain_name" {
  type        = string
  description = "Domain name to use for SSL cert."
}

variable "domain_name_prefix" {
  type        = string
  default     = ""
  description = "Prefix to add to the domain name."
}

variable "rds_snapshot_identifier" {
  default     = null
  type        = string
  description = "Create RDS instance using the provided snapshot ID."
}

variable "invitation_email" {
  type        = string
  description = "Email to send invitation."
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Additional resource tags to apply to applicable resources. Format: {\"key\" = \"value\"}"
}

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

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Additional resource tags to apply to applicable resources. Format: {\"key\" = \"value\"}"
}

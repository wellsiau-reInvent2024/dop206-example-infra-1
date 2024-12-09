# Target region for AWS provider
variable "region" {
  type = string
}

# JWT identity token for AWS provider
variable "identity_token" {
  type      = string
  ephemeral = true
}

# Role ARN for AWS provider
variable "role_arn" {
  type = string
  ephemeral = true
}

# Set to true if you want to deploy the example IAM role
variable "enable_security_scanner" {
  type    = bool
  default = true
}

# Set to true if you want to deploy the example IAM role
variable "enable_finops_scanner" {
  type    = bool
  default = true
}

# Default tags
variable "default_tags" {
  description = "A map of default tags to apply to all AWS resources"
  type        = map(string)
  default     = {}
}
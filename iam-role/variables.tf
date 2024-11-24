variable "enable_security_scanner" {
  description = "Enable security scanner"
  type        = bool
  default     = true
}

variable "enable_finops_scanner" {
  description = "Enable finops scanner"
  type        = bool
  default     = false
}
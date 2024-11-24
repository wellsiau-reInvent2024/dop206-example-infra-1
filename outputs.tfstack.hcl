output "security_scanner_arn" {
  description = "ARN for the security scanner"
  type  = string
  value = component.iam_role.security_scanner
}

output "finops_scanner_arn" {
  description = "ARN for the finops scanner"
  type  = string
  value = component.iam_role.finops_scanner
}
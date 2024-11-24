output "security_scanner" {
  value = var.enable_security_scanner ? aws_iam_role.security_scanner[0].arn : null
}

output "finops_scanner" {
  value = var.enable_finops_scanner ? aws_iam_role.finops_scanner[0].arn : null
}
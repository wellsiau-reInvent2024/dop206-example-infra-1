component "iam_role" {
  source = "./iam-role"

  inputs = {
    enable_security_scanner = var.enable_security_scanner
    enable_finops_scanner   = var.enable_finops_scanner
  }

  providers = {
    aws    = provider.aws.configurations
    random = provider.random.this
  }
}
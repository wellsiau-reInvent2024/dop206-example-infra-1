# random string generator, 4 characters
resource "random_string" "random" {
  length  = 6
  special = false
}

# iam role resource
resource "aws_iam_role" "security_scanner" {
  # count is 1 if var.enable_security_scanner is true
  count               = var.enable_security_scanner ? 1 : 0
  name                = "security_scanner_${random_string.random.result}"
  assume_role_policy  = data.aws_iam_policy_document.security_scanner.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

# data source iam assume role policy document
data "aws_iam_policy_document" "security_scanner" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["397352175627"]
    }
  }
}

# iam role resource
resource "aws_iam_role" "finops_scanner" {
  count               = var.enable_finops_scanner ? 1 : 0
  name                = "finops_scanner_${random_string.random.result}"
  assume_role_policy  = data.aws_iam_policy_document.finops_scanner.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"]
}

# data source iam assume role policy document
data "aws_iam_policy_document" "finops_scanner" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["912606485646"]
    }
  }
}
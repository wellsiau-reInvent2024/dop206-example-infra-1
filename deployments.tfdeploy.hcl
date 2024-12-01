# HCP Terraform uses this to assume the role in the target account
identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "Account_Demo1" {
  inputs = {
    region         = "us-east-1"
    identity_token = identity_token.aws.jwt
    role_arn       = "arn:aws:iam::0123456789012:role/HCPTerraform-Role-StackSet"
    default_tags   = { stacks-environment = "dop206-example-infra-1" }
    enable_security_scanner = true
    enable_finops_scanner   = true
  }
}

deployment "Account_Demo2" {
  inputs = {
    region         = "us-east-1"
    identity_token = identity_token.aws.jwt
    role_arn       = "arn:aws:iam::987654321234:role/HCPTerraform-Role-StackSet"
    default_tags   = { stacks-environment = "dop206-example-infra-1" }
    enable_security_scanner = true
    enable_finops_scanner   = true
  }
}

orchestrate "auto_approve" "all_plan_operations" {
    check {
        condition = context.operation == "plan"
        reason = "Auto-approve every accounts"
    }
}

# orchestrate "auto_approve" "special_account" {
#     check {
#         condition = context.plan.deployment == deployment.Account_Demo1
#         reason = "Auto-approve for account Account_Demo1"
#     }
# }
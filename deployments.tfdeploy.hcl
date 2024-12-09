# HCP Terraform uses this to assume the role in the target account
identity_token "aws" {
  audience = ["aws.workload.identity"]
}

store "varset" "roles" {
  id       = "varset-xzwF62h3nMFLrXp8"
  category = "env"
}

deployment "Account_Demo1" {
  inputs = {
    region         = "us-east-1"
    identity_token = identity_token.aws.jwt
    role_arn       = store.varset.roles.role_1
    default_tags   = { stacks-environment = "dop206-example-infra-1" }
    enable_security_scanner = true
    enable_finops_scanner   = true
  }
}

deployment "Account_Demo2" {
  inputs = {
    region         = "us-east-1"
    identity_token = identity_token.aws.jwt
    role_arn       = store.varset.roles.role_2
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
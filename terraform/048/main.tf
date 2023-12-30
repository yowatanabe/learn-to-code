provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# ******************************************************
# Inspector
# ******************************************************
data "aws_caller_identity" "current" {}

resource "aws_inspector2_enabler" "test" {
  account_ids    = [data.aws_caller_identity.current.account_id]
  resource_types = ["EC2"]
}

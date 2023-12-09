provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "tokyo"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-3"
  alias   = "osaka"
}

data "aws_caller_identity" "current" {}


# *******************************************************************
# 東京リージョンの定義
# *******************************************************************
resource "aws_config_configuration_recorder" "tokyo" {
  name     = "tokyo-test"
  role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"
}

resource "aws_config_delivery_channel" "tokyo" {
  name           = "tokyo-test"
  s3_bucket_name = var.s3_bucket_name
  s3_key_prefix  = "config"
  depends_on     = [aws_config_configuration_recorder.tokyo]
}

resource "aws_config_configuration_recorder_status" "tokyo" {
  name       = aws_config_configuration_recorder.tokyo.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.tokyo]
}


# *******************************************************************
# 大阪リージョンの定義
# *******************************************************************
resource "aws_config_configuration_recorder" "osaka" {
  provider = aws.osaka
  name     = "osaka-test"
  role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"

  recording_group {
    all_supported                 = false

    exclusion_by_resource_types {
      resource_types = [
        "AWS::IAM::Group",
        "AWS::IAM::Policy",
        "AWS::IAM::Role",
        "AWS::IAM::User"
      ]
    }

    recording_strategy {
      use_only = "EXCLUSION_BY_RESOURCE_TYPES"
    }
  }
}

resource "aws_config_delivery_channel" "osaka" {
  provider       = aws.osaka
  name           = "osaka-test"
  s3_bucket_name = var.s3_bucket_name
  s3_key_prefix  = "config"
  depends_on     = [aws_config_configuration_recorder.osaka]
}

resource "aws_config_configuration_recorder_status" "osaka" {
  provider   = aws.osaka
  name       = aws_config_configuration_recorder.osaka.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.osaka]
}

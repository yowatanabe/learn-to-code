provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_cloudwatch_log_group" "test" {
  name              = "test-log-group"
  retention_in_days = 3653
}

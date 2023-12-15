provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

variable "MyEmail" {
  type = string
}

resource "aws_sns_topic" "test" {
  name = "ExampleTestTopic"
}

resource "aws_sns_topic_subscription" "test" {
  topic_arn = aws_sns_topic.test.arn
  protocol  = "email"
  endpoint  = var.MyEmail
}

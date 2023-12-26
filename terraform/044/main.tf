provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

variable "phone_number" {
  type = string
}

resource "aws_sns_topic" "test" {
  name = "test-topic"
}

resource "aws_sns_topic_subscription" "sms_subscription" {
  topic_arn = aws_sns_topic.test.arn
  protocol  = "sms"
  endpoint  = var.phone_number
}

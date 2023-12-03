provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_sns_topic" "test" {
  name         = var.sns_topic_name
  display_name = var.sns_display_name
}

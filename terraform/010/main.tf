provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_sns_topic" "test" {
  name = "MyTopic"
}

resource "aws_sqs_queue" "test" {
  name = "MyQueue"
}

resource "aws_sns_topic_subscription" "test" {
  topic_arn = aws_sns_topic.test.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.test.arn
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_sqs_queue" "test" {
  name                       = "example-queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 30
  receive_wait_time_seconds  = 10

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue.arn,
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name                       = "dead-letter-queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 86400
  visibility_timeout_seconds = 30
}

output "queue_url" {
  value = aws_sqs_queue.test.id
}

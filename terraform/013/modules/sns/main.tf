resource "aws_sns_topic" "test" {
  name = "test-topic"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.test.arn
  protocol  = "email"
  endpoint  = var.my_email
}

resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.test.arn
  protocol  = "lambda"
  endpoint  = var.lambda_arn
}

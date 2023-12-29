provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# ******************************************************
# Variables
# ******************************************************
variable "channel_id" {
  type = string
}

variable "workspace_id" {
  type = string
}


# ******************************************************
# IAM
# ******************************************************
resource "awscc_iam_role" "test" {
  role_name = "test-chatbot-channel-role"
  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "chatbot.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSResourceExplorerReadOnlyAccess"]
}


# ******************************************************
# AWS Chatbot
# ******************************************************
resource "awscc_chatbot_slack_channel_configuration" "test" {
  configuration_name = "test-slack-channel-config"
  iam_role_arn       = awscc_iam_role.test.arn
  slack_channel_id   = var.channel_id
  slack_workspace_id = var.workspace_id
  sns_topic_arns     = [aws_sns_topic.test.arn]
  logging_level      = "NONE"
}


# ******************************************************
# SNS
# ******************************************************
resource "aws_sns_topic" "test" {
  name = "test-topic-chatbot"
}

resource "aws_sns_topic_policy" "test" {
  arn    = aws_sns_topic.test.arn
  policy = data.aws_iam_policy_document.test.json
}

data "aws_iam_policy_document" "test" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.test.arn]
  }
}

# ******************************************************
# EventBridge
# ******************************************************
resource "aws_cloudwatch_event_rule" "rds" {
  name        = "rds-events"
  description = "Capture RDS events"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.rds"
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "chatbot_rds_target" {
  target_id = "SendToChatbot"
  rule      = aws_cloudwatch_event_rule.rds.name
  arn       = aws_sns_topic.test.arn
}

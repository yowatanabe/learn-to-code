resource "aws_iam_role" "test" {
  name = "test-cwlog-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "firehose_full_access" {
  role       = aws_iam_role.test.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess"
}

resource "aws_cloudwatch_log_group" "test" {
  name = "test-log-group"
}

resource "aws_cloudwatch_log_subscription_filter" "test" {
  name           = "test-export-filter"
  role_arn       = aws_iam_role.test.arn
  log_group_name = aws_cloudwatch_log_group.test.name
  filter_pattern = ""

  destination_arn = var.firehose_arn
}

resource "aws_cloudwatch_log_resource_policy" "test" {
  policy_name     = "test-policy"
  policy_document = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.amazonaws.com"
      },
      "Action": "logs:PutLogEvents",
      "Resource": "${aws_cloudwatch_log_group.test.arn}:*"
    }
  ]
}
EOF
}

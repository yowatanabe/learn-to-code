provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "tokyo"
}


# **************************************************
# DynamoDB
# **************************************************
resource "aws_dynamodb_table" "test" {
  name         = "test-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "N"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  tags = {
    Name = "TestTable"
  }
}


# **************************************************
# IAM
# **************************************************
resource "aws_iam_role" "test" {
  name = "test-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_stream_policy" {
  name        = "DynamoDBStreamPolicy"
  description = "Policy for DynamoDB Streams"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams",
        ]
        Effect   = "Allow",
        Resource = "*",
      }
    ],
  })
}

resource "aws_iam_role_policy_attachment" "dynamodb_stream_attachment" {
  policy_arn = aws_iam_policy.dynamodb_stream_policy.arn
  role       = aws_iam_role.test.name
}

resource "aws_iam_role_policy_attachment" "basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.test.name
}


# **************************************************
# Lambda
# **************************************************
data "archive_file" "test" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "test" {
  function_name    = "test-lambda-function"
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  filename         = data.archive_file.test.output_path
  source_code_hash = data.archive_file.test.output_base64sha256
  role             = aws_iam_role.test.arn
}

resource "aws_lambda_event_source_mapping" "example_event_mapping" {
  event_source_arn  = aws_dynamodb_table.test.stream_arn
  function_name     = aws_lambda_function.test.arn
  batch_size        = 5
  starting_position = "LATEST"
}

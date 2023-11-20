provider "aws" {
  region = "ap-northeast-1"
}

data "archive_file" "test" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_iam_role" "test" {
  name = "lambda_test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "test" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  role       = aws_iam_role.test.name
}

resource "aws_lambda_function" "test" {
  filename         = data.archive_file.test.output_path
  function_name    = "MyLambdaFunction"
  role             = aws_iam_role.test.arn
  handler          = "lambda_function.handler"
  source_code_hash = data.archive_file.test.output_base64sha256
  runtime          = "python3.11"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# **************************************************************
# S3
# **************************************************************
resource "aws_s3_bucket" "example" {
  force_destroy = true
}

resource "aws_s3_bucket_notification" "example" {
  bucket = aws_s3_bucket.example.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.example.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_s3_object" "input_txt" {
  bucket  = aws_s3_bucket.example.bucket
  key     = "input.txt"
  content = "Hello, Lambda!"

  depends_on = [aws_lambda_permission.example]
}


# **************************************************************
# IAM
# **************************************************************
resource "aws_iam_role" "example" {
  name = "lambda_execution_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "s3_readonly_access_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.example.name
}


# **************************************************************
# Lambda
# **************************************************************
data "archive_file" "example" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "example" {
  function_name    = "example-lambda-function"
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  filename         = data.archive_file.example.output_path
  source_code_hash = data.archive_file.example.output_base64sha256
  role             = aws_iam_role.example.arn
}

resource "aws_lambda_permission" "example" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.example.arn
}

resource "aws_iam_role" "test" {
  name = "lambda_execution_role"

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

data "archive_file" "test" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_iam_role_policy_attachment" "lambda_fullaccess_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  role       = aws_iam_role.test.name
}

resource "aws_iam_role_policy_attachment" "dynamodb_fullaccess_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.test.name
}

resource "aws_lambda_function" "test" {
  function_name    = "ProcessDataFunction"
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  filename         = data.archive_file.test.output_path
  source_code_hash = data.archive_file.test.output_base64sha256
  role             = aws_iam_role.test.arn

  environment {
    variables = {
      DYNAMO_TABLE_NAME = var.dynamodb_name
    }
  }
}

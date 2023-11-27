resource "aws_iam_role" "test" {
  name = "lambda-test-role"

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

resource "aws_iam_policy" "test" {
  name = "lambda-test-policy"
  path = "/"

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "lambda:InvokeFunction"
          ],
          "Effect" : "Allow",
          "Resource" : "*"
        },
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "lambda_test_policy" {
  policy_arn = aws_iam_policy.test.arn
  role       = aws_iam_role.test.name
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.test.name
}

resource "aws_iam_role_policy_attachment" "s3_full_access_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.test.name
}

data "archive_file" "function_a" {
  type        = "zip"
  source_file = "${path.module}/lambda_function_a.py"
  output_path = "${path.module}/lambda_function_a.zip"
}

data "archive_file" "function_b" {
  type        = "zip"
  source_file = "${path.module}/lambda_function_b.py"
  output_path = "${path.module}/lambda_function_b.zip"
}

data "archive_file" "function_c" {
  type        = "zip"
  source_file = "${path.module}/lambda_function_c.py"
  output_path = "${path.module}/lambda_function_c.zip"
}

resource "aws_lambda_function" "function_a" {
  function_name    = "function_a"
  runtime          = "python3.11"
  handler          = "lambda_function_a.lambda_handler"
  filename         = data.archive_file.function_a.output_path
  source_code_hash = data.archive_file.function_a.output_base64sha256
  role             = aws_iam_role.test.arn
}

resource "aws_lambda_function" "function_b" {
  function_name    = "function_b"
  runtime          = "python3.11"
  handler          = "lambda_function_b.lambda_handler"
  filename         = data.archive_file.function_b.output_path
  source_code_hash = data.archive_file.function_b.output_base64sha256
  role             = aws_iam_role.test.arn
}

resource "aws_lambda_function" "function_c" {
  function_name    = "function_c"
  runtime          = "python3.11"
  handler          = "lambda_function_c.lambda_handler"
  filename         = data.archive_file.function_c.output_path
  source_code_hash = data.archive_file.function_c.output_base64sha256
  role             = aws_iam_role.test.arn

}

resource "aws_lambda_permission" "function_a" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_a.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}

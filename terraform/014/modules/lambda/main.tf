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
            "logs:PutLogEvents",
            "logs:CreateLogGroup",
            "logs:CreateLogStream"
          ],
          "Effect" : "Allow",
          "Resource" : "arn:aws:logs:*:*:*"
        },
        {
          "Action" : [
            "s3:GetObject"
          ],
          "Effect" : "Allow",
          "Resource" : "arn:aws:s3:::*/*"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn = aws_iam_policy.test.arn
  role       = aws_iam_role.test.name
}

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

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.bucket_arn
}

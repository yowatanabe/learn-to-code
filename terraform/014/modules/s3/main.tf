resource "aws_s3_bucket" "test" {
  force_destroy = true
}

resource "aws_s3_bucket_notification" "test" {
  bucket = aws_s3_bucket.test.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }
}

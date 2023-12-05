output "lambda_function_name" {
  value = var.lambda_function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.test.arn
}

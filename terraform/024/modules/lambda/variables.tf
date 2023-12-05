variable "lambda_function_name" {
  default = "test-lambda-function"
}

variable "s3_bucket_name" {
  type = string
}

variable "cloudwatch_log_group_arn" {
  type = string
}

resource "aws_cloudwatch_log_group" "test" {
  name = "subscription-filter-test"
}

resource "aws_cloudwatch_log_subscription_filter" "test" {
  name = "test-export-filter"
  log_group_name = aws_cloudwatch_log_group.test.name
  filter_pattern = ""
  destination_arn = var.lambda_function_arn
}

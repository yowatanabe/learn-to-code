provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_cloudwatch_log_group" "test" {
  name = "example-logs-group"
}

resource "aws_cloudwatch_log_metric_filter" "test" {
  name           = "example-metric-filter"
  pattern        = "{$.status = \"ERROR\"}"
  log_group_name = aws_cloudwatch_log_group.test.name

  metric_transformation {
    name          = "ExampleMetric"
    namespace     = "CustomMetrics"
    value         = "1"
    default_value = 0
  }
}

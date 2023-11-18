output "db_endpoint_uri" {
  value = aws_rds_cluster.test.endpoint
}
output "db_reader_endpoint_uri" {
  value = aws_rds_cluster.test.reader_endpoint
}

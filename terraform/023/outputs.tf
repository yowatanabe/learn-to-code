output "db_cluster_endpoint" {
  value = aws_rds_cluster.test.endpoint
}

output "db_cluster_reader_endpoint" {
  value = aws_rds_cluster.test.reader_endpoint
}

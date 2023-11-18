provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_secretsmanager_secret" "test" {
  name = "aurora-master-password"
}

resource "aws_secretsmanager_secret_version" "test" {
  secret_id     = aws_secretsmanager_secret.test.id
  secret_string = var.secret_string
}

resource "aws_rds_cluster" "test" {
  cluster_identifier  = "test"
  engine              = "aurora-postgresql"
  master_username     = "test"
  master_password     = aws_secretsmanager_secret_version.test.secret_string
  skip_final_snapshot = true
  tags = {
    Environment = "production"
  }
}

resource "aws_rds_cluster_instance" "aurora_writer_instance" {
  count              = 1
  identifier         = "aurora-writer-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.test.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.test.engine
}

resource "aws_rds_cluster_instance" "aurora_reader_instance" {
  count              = 1
  identifier         = "aurora-reader-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.test.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.test.engine
}

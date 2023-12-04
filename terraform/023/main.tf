provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_rds_cluster" "test" {
  cluster_identifier  = var.db_cluster_name
  engine              = "aurora-mysql"
  engine_version      = "5.7"
  master_username     = var.db_username
  master_password     = var.db_password
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "test" {
  count = 2

  identifier         = "test-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.test.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.test.engine
  engine_version     = aws_rds_cluster.test.engine_version
}

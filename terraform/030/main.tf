provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "primary"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-3"
  alias   = "secondary"
}

resource "aws_rds_global_cluster" "test" {
  global_cluster_identifier = "my-global-database"
  engine                    = "aurora-mysql"
  engine_version            = "8.0.mysql_aurora.3.04.1"
  database_name             = "mydatabase"
}

resource "aws_rds_cluster" "primary" {
  provider                  = aws.primary
  cluster_identifier        = "my-aurora-cluster-primary"
  engine                    = aws_rds_global_cluster.test.engine
  engine_version            = aws_rds_global_cluster.test.engine_version
  global_cluster_identifier = aws_rds_global_cluster.test.id
  availability_zones        = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  database_name             = "mydatabase"
  master_username           = "admin"
  master_password           = "adminpassword"
  backup_retention_period   = 7
  preferred_backup_window   = "03:00-04:00"
  port                      = 3306
  skip_final_snapshot       = true

  tags = {
    Name = "my-aurora-cluster-primary"
  }
}

resource "aws_rds_cluster_instance" "primary" {
  provider             = aws.primary
  count                = 2
  engine               = aws_rds_global_cluster.test.engine
  engine_version       = aws_rds_global_cluster.test.engine_version
  identifier           = "my-aurora-cluster-primary-${count.index}"
  cluster_identifier   = aws_rds_cluster.primary.id
  instance_class       = "db.r5.large"
  db_subnet_group_name = "default"
  ca_cert_identifier   = "rds-ca-rsa2048-g1"
}

resource "aws_rds_cluster" "secondary" {
  provider                  = aws.secondary
  cluster_identifier        = "my-aurora-cluster-secondary"
  engine                    = aws_rds_global_cluster.test.engine
  engine_version            = aws_rds_global_cluster.test.engine_version
  global_cluster_identifier = aws_rds_global_cluster.test.id
  availability_zones        = ["ap-northeast-3a", "ap-northeast-3b", "ap-northeast-3c"]
  backup_retention_period   = 7
  preferred_backup_window   = "03:00-04:00"
  port                      = 3306
  skip_final_snapshot       = true

  tags = {
    Name = "my-aurora-cluster-secondary"
  }

  depends_on = [
    aws_rds_cluster_instance.primary
  ]
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "tokyo"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-3"
  alias   = "osaka"
}

resource "aws_rds_cluster" "aurora_cluster_primary" {
  cluster_identifier              = "my-aurora-cluster-primary"
  engine                          = "aurora-mysql"
  engine_version                  = "8.0.mysql_aurora.3.05.1"
  availability_zones              = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  database_name                   = "mydatabase"
  master_username                 = "admin"
  master_password                 = "adminpassword"
  backup_retention_period         = 7
  preferred_backup_window         = "03:00-04:00"
  port                            = 3306
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_primary.name
  skip_final_snapshot             = true


  tags = {
    Name = "my-aurora-cluster-primary"
  }
}

resource "aws_rds_cluster_parameter_group" "aurora_cluster_primary" {
  name        = "my-aurora-cluster-primary-pg"
  family      = "aurora-mysql8.0"
  description = "Custom cluster parameter group"

  parameter {
    name         = "binlog_format"
    value        = "MIXED"
    apply_method = "pending-reboot"
  }

}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "my-aurora-cluster-primary-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_cluster_primary.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.aurora_cluster_primary.engine
  engine_version     = aws_rds_cluster.aurora_cluster_primary.engine_version
  ca_cert_identifier = "rds-ca-rsa2048-g1"
}


resource "aws_rds_cluster" "aurora_cluster_replica" {
  provider                = aws.osaka
  cluster_identifier      = "my-aurora-cluster-replica"
  engine                  = "aurora-mysql"
  engine_version          = "8.0.mysql_aurora.3.05.1"
  availability_zones      = ["ap-northeast-3a", "ap-northeast-3b", "ap-northeast-3c"]
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  port                    = 3306
  skip_final_snapshot     = true

  replication_source_identifier = aws_rds_cluster.aurora_cluster_primary.arn

  tags = {
    Name = "my-aurora-cluster-replica"
  }
}

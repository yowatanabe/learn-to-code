provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_db_instance" "test" {
  identifier          = "test-db"
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  allocated_storage   = 10
  storage_type        = "gp2"
  username            = "db_user"
  password            = aws_ssm_parameter.test.value
  ca_cert_identifier  = "rds-ca-rsa2048-g1"
  skip_final_snapshot = true

  tags = {
    Name = "TestDB"
  }
}

resource "aws_ssm_parameter" "test" {
  name        = "/database/password"
  description = "Database Password"
  type        = "SecureString"
  value       = var.database_master_password
}

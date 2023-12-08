provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "test" {
  name        = "test"
  description = "For RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "test" {
  identifier             = "test-db-instance"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  db_name                = "mysql_db"
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.test.id]
  ca_cert_identifier     = "rds-ca-rsa2048-g1"

  tags = {
    Name        = "test-db-instance",
    Environment = "test"
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# **************************************************
# IAM
# **************************************************
resource "aws_iam_role" "ec2_role" {
  name = "test-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ssm-instance-profile"
  role = aws_iam_role.ec2_role.name
}

# **************************************************************
# EC2
# **************************************************************
resource "aws_security_group" "ec2" {
  name        = "ec2-sg"
  description = "RDS Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds" {
  name        = "rds-sg"
  description = "RDS Security Group"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# **************************************************************
# RDS
# **************************************************************
resource "aws_db_instance" "test" {
  identifier             = "test-db"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.rds_instance_class
  username               = "admin"
  password               = "adminpassword"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
}


# **************************************************************
# EC2
# **************************************************************
resource "aws_instance" "example_instance" {
  ami                    = data.aws_ami.al2.id
  instance_type          = var.ec2_instance_type
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance_profile.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y mysql
              mysql -h ${aws_db_instance.test.address} -u admin -padminpassword -e 'create database hogehoge;'
              EOF
}

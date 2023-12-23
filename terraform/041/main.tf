provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "tokyo"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami" {
  type = string
}


# **************************************************
# Security Group
# **************************************************
resource "aws_security_group" "efs" {
  name        = "efs-security-group"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ec2.id}"]
  }
}

resource "aws_security_group" "ec2" {
  name        = "ec2-security-group"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
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


# **************************************************
# EFS
# **************************************************
resource "aws_efs_file_system" "main" {
  creation_token   = "test-efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = false

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

resource "aws_efs_mount_target" "mount_target_1" {
  file_system_id  = aws_efs_file_system.main.id
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.efs.id]
}


# **************************************************
# EC2
# **************************************************
resource "aws_instance" "main" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance_profile.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id              = var.subnet_id
  user_data              = <<-EOF
              #!/bin/bash
              yum install -y nfs-utils
              mkdir /mnt/efs
              mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.main.dns_name}:/ /mnt/efs
              EOF
}

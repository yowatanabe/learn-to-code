provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# ******************************************************
# Variables
# ******************************************************
variable "ssh-key" {
  type = string
}


# ******************************************************
# S3
# ******************************************************
resource "aws_s3_bucket" "test" {
  force_destroy = true
}


# ******************************************************
# IAM
# ******************************************************
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["transfer.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "user1" {
  name               = "test-transfer-user-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "user1" {
  statement {
    sid       = "AllowFullAccesstoS3"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "user1" {
  name   = "test-transfer-user-iam-policy"
  role   = aws_iam_role.user1.id
  policy = data.aws_iam_policy_document.user1.json
}


# ******************************************************
# AWS Transfer Family
# ******************************************************
resource "aws_transfer_server" "test" {
  identity_provider_type = "SERVICE_MANAGED"

  tags = {
    NAME = "test-server"
  }
}

resource "aws_transfer_user" "user1" {
  server_id = aws_transfer_server.test.id
  user_name = "user1"
  role      = aws_iam_role.user1.arn

  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry  = "/"
    target = "/${aws_s3_bucket.test.id}/$${Transfer:UserName}"
  }
}

resource "aws_transfer_ssh_key" "user1" {
  server_id = aws_transfer_server.test.id
  user_name = aws_transfer_user.user1.user_name
  body      = var.ssh-key
}

output "sftp_login" {
  value = "${aws_transfer_server.test.endpoint} ${aws_transfer_user.user1.user_name}"
}

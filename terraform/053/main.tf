provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# ********************************************
# DynamoDB
# ********************************************
resource "aws_dynamodb_table" "table1" {
  name         = "table1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  attribute {
    name = "ID"
    type = "N"
  }

  tags = {
    BACKUP = "true"
  }
}

resource "aws_dynamodb_table" "table2" {
  name         = "table2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  attribute {
    name = "ID"
    type = "N"
  }
}


# ********************************************
# IAM
# ********************************************
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_role" "test" {
  name               = "test-backup-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "test" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.test.name
}


# ********************************************
# AWS Backup
# ********************************************
resource "aws_backup_vault" "test" {
  name          = "dynamodb-backup-vault"
  force_destroy = true
}

resource "aws_backup_plan" "test" {
  name = "dynamodb-backup-plan"

  rule {
    rule_name         = "dynamodb-backup-rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 23 * * ? *)"

    lifecycle {
      delete_after = 365
    }
  }
}

resource "aws_backup_selection" "test" {
  iam_role_arn = aws_iam_role.test.arn
  name         = "dynamodb-backup-selection"
  plan_id      = aws_backup_plan.test.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BACKUP"
    value = "true"
  }
}

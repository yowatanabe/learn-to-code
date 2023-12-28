provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# ******************************************************
# IAM
# ******************************************************
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

resource "aws_iam_role_policy_attachment" "s3_backup" {
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Backup"
  role       = aws_iam_role.test.name
}

resource "aws_iam_role_policy_attachment" "s3_restore" {
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Restore"
  role       = aws_iam_role.test.name
}


# ******************************************************
# AWS Backup
# ******************************************************
resource "aws_backup_vault" "test" {
  name = "test-vault"
}

resource "aws_backup_plan" "test" {
  name = "test-backup-plan"

  rule {
    rule_name         = "daily_backup"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 0 * * ? *)"
  }
}

resource "aws_backup_selection" "test" {
  iam_role_arn = aws_iam_role.test.arn
  name         = "test-backup-selection"
  plan_id      = aws_backup_plan.test.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BACKUP"
    value = "true"
  }
}

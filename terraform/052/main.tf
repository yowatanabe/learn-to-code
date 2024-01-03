provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


# ********************************************
# S3
# ********************************************
resource "aws_s3_bucket" "test" {
  force_destroy = true
}

data "aws_iam_policy_document" "test" {
  statement {
    sid = "Deny non-HTTPS access"

    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }

  statement {
    sid = "Deny incorrect encryption header. This is optional"

    effect = "Deny"

    principals {
      type        = "Service"
      identifiers = ["macie.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}/testprefix/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption-aws-kms-key-id"
      values   = ["${aws_kms_key.test.arn}"]
    }
  }

  statement {
    sid = "Deny unencrypted object uploads. This is optional"

    effect = "Deny"

    principals {
      type        = "Service"
      identifiers = ["macie.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}/testprefix/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption"
      values   = ["aws:kms"]
    }
  }

  statement {
    sid = "Allow Macie to upload objects to the bucket"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["macie.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}/testprefix/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${data.aws_caller_identity.current.account_id}"]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:macie2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:export-configuration:*",
        "arn:aws:macie2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:classification-job/*"
      ]
    }
  }

  statement {
    sid = "Allow Macie to use the getBucketLocation operation"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["macie.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketLocation",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${data.aws_caller_identity.current.account_id}"]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:macie2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:export-configuration:*",
        "arn:aws:macie2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:classification-job/*"
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "test" {
  bucket = aws_s3_bucket.test.id
  policy = data.aws_iam_policy_document.test.json
}


# ********************************************
# KMS
# ********************************************
resource "aws_kms_key" "test" {
  description = "test"
}

resource "aws_kms_key_policy" "test" {
  key_id = aws_kms_key.test.id
  policy = jsonencode({
    Id = "test"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
      },
    ]
    Version = "2012-10-17"
  })
}


# ********************************************
# Macie
# ********************************************
resource "aws_macie2_account" "test" {
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  status                       = "ENABLED"
}

resource "aws_macie2_classification_export_configuration" "test" {
  depends_on = [
    aws_macie2_account.test,
  ]
  s3_destination {
    bucket_name = aws_s3_bucket.test.bucket
    key_prefix  = "testprefix/"
    kms_key_arn = aws_kms_key.test.arn
  }
}

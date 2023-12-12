provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_s3_bucket" "test" {
  force_destroy = true
}

resource "aws_s3_bucket_logging" "test" {
  bucket = aws_s3_bucket.test.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket" "log_bucket" {
  force_destroy = true
}

resource "aws_s3_bucket_policy" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id
  policy = data.aws_iam_policy_document.log_bucket.json
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "log_bucket" {
  statement {
    sid = "S3ServerAccessLogsPolicy"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.log_bucket.arn}/*"
    ]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "${aws_s3_bucket.test.arn}"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
        "${data.aws_caller_identity.current.account_id}"
      ]
    }
  }
}

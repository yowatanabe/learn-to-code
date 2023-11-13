provider "aws" {
  region = "ap-northeast-1"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "test" {
  # bucket = "" # 任意の名前を設定する場合はユニークな名前にする
}

resource "aws_s3_bucket_server_side_encryption_configuration" "test" {
  bucket = aws_s3_bucket.test.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "test" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::582318560864:root"]
    }

    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.test.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "test" {
  bucket = aws_s3_bucket.test.id
  policy = data.aws_iam_policy_document.test.json
}

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

resource "aws_s3_bucket_lifecycle_configuration" "test" {
  bucket = aws_s3_bucket.test.id

  rule {
    id     = "log"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 180
    }
  }

}

data "aws_iam_policy_document" "allow_cloudtrail" {
  statement {
    sid = "AWSCloudTrailAclCheck20150319"

    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }

    actions = [
      "s3:GetBucketAcl",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/test-cloudtrail"]
    }
  }

  statement {
    sid = "AWSCloudTrailWrite20150319"

    principals {
      identifiers = ["cloudtrail.amazonaws.com"]
      type        = "Service"
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.test.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/test-cloudtrail"]
    }
  }
}

resource "aws_s3_bucket_policy" "test_policy" {
  bucket = aws_s3_bucket.test.id
  policy = data.aws_iam_policy_document.allow_cloudtrail.json
}


# ********************************************
# CloudTrail
# ********************************************
resource "aws_cloudtrail" "test" {
  name                  = "test-cloudtrail"
  s3_bucket_name        = aws_s3_bucket.test.id
  is_multi_region_trail = true

  depends_on = [ aws_s3_bucket_policy.test_policy ]
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  alias   = "tokyo"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-3"
  alias   = "osaka"
}



# **************************************************
# IAM
# **************************************************
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "replication" {
  name               = "test-replication-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "replication" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [aws_s3_bucket.tokyo.arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]

    resources = ["${aws_s3_bucket.tokyo.arn}/*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
    ]

    resources = ["${aws_s3_bucket.osaka.arn}/*"]
  }
}

resource "aws_iam_policy" "replication" {
  name   = "tf-iam-role-policy-replication-12345"
  policy = data.aws_iam_policy_document.replication.json
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}



# **************************************************
# S3 - Tokyo
# **************************************************

resource "aws_s3_bucket" "tokyo" {
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "tokyo" {
  bucket = aws_s3_bucket.tokyo.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "tokyo" {
  depends_on = [aws_s3_bucket_versioning.tokyo]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.tokyo.id

  rule {
    id = "test-replication-rule"

    filter {
      prefix = ""
    }

    status = "Enabled"

    destination {
      bucket = aws_s3_bucket.osaka.arn

      replication_time {
        status = "Enabled"
        time {
          minutes = 15
        }
      }

      metrics {
        event_threshold {
          minutes = 15
        }
        status = "Enabled"
      }
    }

    delete_marker_replication {
      status = "Disabled"
    }
  }
}

resource "aws_iam_role" "replication_role" {
  name = "example-replication-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        }
      }
    ]
  })
}



# **************************************************
# S3 - Osaka
# **************************************************
resource "aws_s3_bucket" "osaka" {
  provider      = aws.osaka
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "osaka" {
  provider = aws.osaka
  bucket   = aws_s3_bucket.osaka.id
  versioning_configuration {
    status = "Enabled"
  }
}

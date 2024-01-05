provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_ecr_repository" "test" {
  name = "example-repo"
  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}

resource "aws_ecr_lifecycle_policy" "test" {
  repository = aws_ecr_repository.test.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_ecr_repository" "test" {
  name = "test-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.test.repository_url
}

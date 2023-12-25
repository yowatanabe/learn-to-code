provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_ecr_repository" "test" {
  name = "test-repository"
  force_delete = true
}

resource "null_resource" "test_build_and_push" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOT
      # コンテナイメージをビルド
      docker build -t ${aws_ecr_repository.test.repository_url}:latest .

      # ECRにログイン
      aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${aws_ecr_repository.test.repository_url}

      # コンテナイメージをECRにプッシュ
      docker push ${aws_ecr_repository.test.repository_url}:latest
    EOT
  }
}

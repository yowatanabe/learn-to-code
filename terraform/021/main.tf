provider "aws" {
  region = "ap-northeast-1"
}

variable "db_username" {
}

variable "db_password" {
}

variable "db_host" {
}

variable "db_name" {
}

resource "aws_secretsmanager_secret" "database" {
  name = "test-secrets"
}

resource "aws_secretsmanager_secret_version" "database" {
  secret_id = aws_secretsmanager_secret.database.id
  secret_string = jsonencode({
    username = var.db_username,
    password = var.db_password,
    host     = var.db_host,
    dbname   = var.db_name,
  })
}

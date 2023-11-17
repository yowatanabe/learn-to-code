provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_dynamodb_table" "test" {
  name         = "test"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ID"
  attribute {
    name = "ID"
    type = "N"
  }

  tags = {
    Name        = "test"
    Environment = "test"
  }
}

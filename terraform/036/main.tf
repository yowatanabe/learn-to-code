provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_dynamodb_table" "test" {
  name         = "test-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "N"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  tags = {
    Name = "TestTable"
  }
}

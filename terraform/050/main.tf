provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_dynamodb_table" "test" {
  name         = "test-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "user_id"
  attribute {
    name = "user_id"
    type = "N"
  }
  attribute {
    name = "username"
    type = "S"
  }

  global_secondary_index {
    name            = "username-index"
    hash_key        = "username"
    range_key       = "user_id"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }
}

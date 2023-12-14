provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_dynamodb_table" "test" {
  name           = "ExampleTable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "ID"
  range_key      = "Timestamp"

  attribute {
    name = "ID"
    type = "N"
  }

  attribute {
    name = "Timestamp"
    type = "S"
  }
}

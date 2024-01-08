provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_dynamodb_table" "example" {
  name         = "ExampleTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"

  attribute {
    name = "UserId"
    type = "N"
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_dynamodb_table_item" "example" {
  for_each   = { for record in local.items_dataset : record.UserId => record }
  table_name = aws_dynamodb_table.example.name
  hash_key   = aws_dynamodb_table.example.hash_key

  item = <<ITEM
  {
    "UserId": {"N": "${each.value.UserId}"},
    "Username": {"S": "${each.value.Username}"},
    "Email": {"S": "${each.value.Email}"}
  },
ITEM
}

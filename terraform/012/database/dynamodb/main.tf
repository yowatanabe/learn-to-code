resource "aws_dynamodb_table" "test" {
  name           = "MyDataTable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  hash_key = "DataID"
  attribute {
    name = "DataID"
    type = "S"
  }
}

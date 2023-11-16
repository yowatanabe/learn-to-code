variable "bucket_name" {
  type = string
  default = "_ユニークな名前_"
}

variable "file_name" {
  type    = string
  default = "test/test.txt"
}

variable "content" {
  type    = string
  default = "テストファイル"
}

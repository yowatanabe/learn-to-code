provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "test" {
  ami           = "ami-098940df4d3292e9a"
  instance_type = "t2.micro"
  tags = {
    Name = "MyInstance"
  }
}

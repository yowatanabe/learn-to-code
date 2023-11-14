provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "test" {
  ami           = "ami-012261b9035f8f938"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.test.id]
  tags = {
    Name = "test"
  }
}

resource "aws_security_group" "test" {
  name        = "test-sg"
  description = "For Test SV"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

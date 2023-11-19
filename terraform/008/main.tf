provider "aws" {
  region = "ap-northeast-1" # 任意のリージョンを指定してください
}

resource "aws_elb" "test" {
  name               = "test"
  availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  instances = aws_instance.test[*].id
}

resource "aws_instance" "test" {
  count = 2

  ami           = "ami-012261b9035f8f938"
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance-${count.index + 1}"
  }
}

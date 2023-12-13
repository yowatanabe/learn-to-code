provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  for_each = {
    subnet_1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-northeast-1a"
    },
    subnet_2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "ap-northeast-1c"
    },
    subnet_3 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "ap-northeast-1d"
    }
  }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}

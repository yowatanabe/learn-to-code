provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}


# *****************************************:
# VPC
# *****************************************:
resource "aws_vpc" "test" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public" {
  count = 2

  cidr_block        = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  availability_zone = element(["ap-northeast-1a", "ap-northeast-1c"], count.index)
  vpc_id            = aws_vpc.test.id

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "test-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "test-rtb"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


# *****************************************:
# ALB
# *****************************************:
resource "aws_lb" "test" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]
}

resource "aws_security_group" "lb" {
  name        = "lb-sg"
  description = "Security group for application load balancer"
  vpc_id      = aws_vpc.test.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-sg"
  }
}


# # *****************************************:
# # WAF
# # *****************************************:
resource "aws_wafv2_web_acl" "test" {
  name  = "test-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "rule-1"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "test-waf"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "test" {
  resource_arn = aws_lb.test.arn
  web_acl_arn  = aws_wafv2_web_acl.test.arn
}

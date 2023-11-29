provider "aws" {
  region = "ap-northeast-1"
}

variable "subnet_id_1" {}
variable "subnet_id_2" {}
variable "securitygroup_id" {}

resource "aws_ecs_cluster" "test" {
  name = "test-cluster"
}

resource "aws_ecs_task_definition" "test" {
  family                   = "test-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.test.arn
  task_role_arn      = aws_iam_role.test.arn

  container_definitions = jsonencode([
    {
      name  = "test-container",
      image = "nginx:latest"
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80,
        },
      ],
    },
  ])
}

resource "aws_iam_role" "test" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com",
        }
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
}

resource "aws_ecs_service" "test" {
  name            = "test-service"
  cluster         = aws_ecs_cluster.test.id
  task_definition = aws_ecs_task_definition.test.arn
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [var.subnet_id_1, var.subnet_id_2]
    security_groups  = [var.securitygroup_id]
    assign_public_ip = true  # 前段にロードバランサーを設置しないため設定
  }
  desired_count = 1
}

#################################################
# Provider
#################################################
provider "aws" {
  region = "eu-north-1"
}

#################################################
# Existing VPC
#################################################
data "aws_vpc" "existing" {
  id = "vpc-0d265f69692c0e733"
}

#################################################
# Existing Subnets (MAKE SURE THESE ARE DIFFERENT)
#################################################
data "aws_subnet" "public_1" {
  id = "subnet-0ed25ae1e9dad56f3"
}

data "aws_subnet" "public_2" {
  id = "subnet-09f221aab6facf516"
}

#################################################
# Existing Security Group
#################################################
data "aws_security_group" "ecs_sg" {
  id = "sg-0abb169a9e0d4a232"
}

#################################################
# Existing ECS Cluster
#################################################
data "aws_ecs_cluster" "app" {
  cluster_name = "ecs-fargate-cluster"
}

#################################################
# ECS Task Definition
#################################################
resource "aws_ecs_task_definition" "app" {
  family                   = "ecs-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = "arn:aws:iam::621072894747:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = "ecs-app"
      image     = "621072894747.dkr.ecr.eu-north-1.amazonaws.com/ecs-app-repo:latest"
      essential = true

      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}

#################################################
# ECS Service
#################################################
resource "aws_ecs_service" "app" {
  name            = "ecs-app-service"
  cluster         = aws_ecs_cluster.app.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [
      data.aws_subnet.public_1.id,
      data.aws_subnet.public_2.id
    ]

    security_groups  = [data.aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}



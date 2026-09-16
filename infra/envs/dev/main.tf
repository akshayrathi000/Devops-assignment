terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "../../modules/network"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "alb" {
  source = "../../modules/alb"

  environment       = var.environment
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids

  target_port       = 80
  health_check_path = "/"
}
module "ecs" {
  source = "../../modules/ecs"

  environment           = var.environment
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
  target_group_arn      = module.alb.target_group_arn

  container_name  = "nginx"
  container_image = "nginx:latest"
  container_port  = 80

  task_cpu      = 256
  task_memory   = 512
  desired_count = 1

}

module "rds" {
  source = "../../modules/rds"

  environment           = var.environment
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  ecs_security_group_id = module.ecs.ecs_security_group_id

  engine_version          = "16"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  backup_retention_period = 1
  deletion_protection     = false

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

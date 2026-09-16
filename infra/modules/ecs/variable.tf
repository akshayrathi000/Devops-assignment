variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ALB security group ID"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "container_name" {
  description = "ECS container name"
  type        = string
  default     = "nginx"
}

variable "container_image" {
  description = "Container image"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "task_cpu" {
  description = "Fargate task CPU"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Fargate task memory"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of ECS tasks"
  type        = number
  default     = 1
}

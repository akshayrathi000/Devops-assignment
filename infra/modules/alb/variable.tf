variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "target_port" {
  description = "Application target port"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Application health check path"
  type        = string
  default     = "/"
}

aws_region = "ap-south-1"

environment = "prod"

vpc_cidr = "10.1.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]
db_name     = "hotel_booking"
db_username = "admin"
db_password = "DevPassword123!"

ecs_desired_count = 2
ecs_cpu           = 512
ecs_memory        = 1024

rds_instance_class      = "db.t3.small"
rds_backup_retention    = 14
rds_deletion_protection = true

db_name     = "devops_tools"
db_username = "postgres"
db_password = "change-me-for-local-plan"

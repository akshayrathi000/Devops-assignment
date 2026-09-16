environment = "prod"

vpc_cidr = "10.1.0.0/16"

availability_zones = [
  "ap-southeast-1a",
  "ap-southeast-1b"
]

public_subnet_cidrs = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

private_subnet_cidrs = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]

db_name     = "hotel_booking"
db_username = "admin"
db_password = "ProdPassword123!"

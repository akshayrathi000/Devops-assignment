output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = aws_db_instance.postgres.address
}

output "rds_port" {
  description = "RDS PostgreSQL port"
  value       = aws_db_instance.postgres.port
}

output "rds_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.postgres.id
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds.id
}

output "db_subnet_group_name" {
  description = "RDS DB subnet group"
  value       = aws_db_subnet_group.this.name
}

output "db_instance_id" {
  value       = aws_db_instance.db.id
  description = "The database instance identifier"
}

output "db_instance_address" {
  value       = aws_db_instance.db.address
  description = "The hostname of the RDS instance"
}

output "db_instance_port" {
  value       = aws_db_instance.db.port
  description = "The database port"
}

output "db_instance_resource_id" {
  value       = aws_db_instance.db.resource_id
  description = "The RDS Resource ID of this instance"
}

output "db_name" {
  value       = aws_db_instance.db.db_name
  description = "The name of the database"
}

output "db_username" {
  value       = aws_db_instance.db.username
  description = "The master username of the database"
  sensitive   = true
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.db.name
  description = "Name of the DB subnet group"
}

output "secrets_manager_secret_id" {
  value       = try(aws_secretsmanager_secret.db_credentials.id, null)
  description = "The ID of the Secrets Manager secret containing database credentials"
}

output "secrets_manager_secret_arn" {
  value       = try(aws_secretsmanager_secret.db_credentials.arn, null)
  description = "The ARN of the Secrets Manager secret containing database credentials"
}

output "secrets_manager_secret_name" {
  value       = try(aws_secretsmanager_secret.db_credentials.name, null)
  description = "The name of the Secrets Manager secret containing database credentials"
}

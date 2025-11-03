output "bastion_public_ip" {
  value       = module.bastion.bastion_public_ip
  description = "Public IP of bastion host"
}

output "secrets_manager_secret_id" {
  value       = module.database.secrets_manager_secret_id
  description = "Secrets Manager secret ID for database credentials"
}

output "db_instance_address" {
  value       = module.database.db_instance_address
  description = "The hostname of the RDS instance"
}

# output "alb_dns_name" {
#   value       = module.alb.alb_dns_name
#   description = "DNS name of the Application Load Balancer"
# }

# output "vpc_id" {
#   value       = module.network.vpc_id
#   description = "VPC ID"
# }
#
# output "public_subnet_ids" {
#   value       = module.network.public_subnet_ids
#   description = "Public subnet IDs"
# }
#
# output "private_subnet_ids" {
#   value       = module.network.private_subnet_ids
#   description = "Private subnet IDs"
# }

# output "secrets_manager_secret_arn" {
#   value       = module.database.secrets_manager_secret_arn
#   description = "Secrets Manager secret ARN for database credentials"
# }

# output "secrets_manager_secret_name" {
#   value       = module.database.secrets_manager_secret_name
#   description = "Secrets Manager secret name for database credentials"
# }


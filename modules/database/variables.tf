variable "project_name" {
  type = string
}

variable "publicly_accessible" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "backup_retention_period" {
  type        = number
  description = "n days"
  default     = 1
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for DB subnet group"
}

variable "vpc_security_group_id" {
  type        = string
  description = "Security group ID for RDS instance"
}

variable "db_name" {
  type    = string
  default = "main"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_engine" {
  type        = string
  default     = "aurora"
  description = "Database engine"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version"
}

variable "db_instance_class" {
  type        = string
  description = "Database instance type"
}

variable "db_allocated_storage" {
  type        = number
  description = "Size of database"
}

variable "db_storage_type" {
  type        = string
  description = "Database Storage type"
}


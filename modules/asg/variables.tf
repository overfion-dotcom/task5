variable "project_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "iam_instance_profile_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "asg_min_size" {
  type    = number
  default = 0
}

variable "asg_max_size" {
  type    = number
  default = 3
}

variable "asg_desired_capacity" {
  type    = number
  default = 2
}

variable "health_check_grace_period" {
  type    = number
  default = 300
}

variable "cpu_target_value" {
  type    = number
  default = 75.0
}

# ECR & Database variables
variable "ecr_repository_url" {
  type = string
}

variable "image_tag" {
  type    = string
  default = "1.0"
}

variable "region" {
  type = string
}

variable "db_host" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "secrets_manager_secret_arn" {
  type        = string
  description = "ARN of the database password secret in AWS Secrets Manager"
}


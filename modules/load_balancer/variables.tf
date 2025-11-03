variable "project_name" {
  type = string
}

variable "security_group_id" {
  type        = string
  description = "Security group ID for ALB"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for ALB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for target group"
}

variable "target_group_port" {
  type        = number
  description = "Port for target group"
  default     = 80
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol for target group"
  default     = "HTTP"
}

variable "health_check_enabled" {
  type        = bool
  description = "Enable health checks"
  default     = true
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "Number of consecutive health checks to mark target as healthy"
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "Number of consecutive failed health checks to mark target as unhealthy"
  default     = 2
}

variable "health_check_timeout" {
  type        = number
  description = "Health check timeout in seconds"
  default     = 5
}

variable "health_check_interval" {
  type        = number
  description = "Health check interval in seconds"
  default     = 30
}

variable "health_check_path" {
  type        = string
  description = "Health check path"
  default     = "/"
}

variable "health_check_matcher" {
  type        = string
  description = "HTTP codes to consider healthy"
  default     = "200"
}

variable "deregistration_delay" {
  type        = number
  description = "Connection draining timeout in seconds"
  default     = 30
}

variable "alb_enable_deletion_protection" {
  type        = bool
  description = "Enable deletion protection for ALB"
  default     = false
}

variable "alb_internal" {
  type        = bool
  description = "Make ALB internal"
  default     = false
}

variable "listener_port" {
  type        = number
  description = "Listener port"
  default     = 80
}

variable "listener_protocol" {
  type        = string
  description = "Listener protocol"
  default     = "HTTP"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags for ALB resources"
  default     = {}
}

variable "project_name" {
  type = string
}

variable "ssh_key_path" {
  type        = string
  description = "Path to SSH public key"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for bastion host"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
}

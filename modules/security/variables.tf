variable "project_name" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "my_ip" {
  type = list(string)
}

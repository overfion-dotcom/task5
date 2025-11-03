variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "az" {
  type        = list(string)
  description = "Availability zones"
}

variable "subnets_per_az" {
  type        = map(number)
  description = "Number of subnets per AZ for each type"
}

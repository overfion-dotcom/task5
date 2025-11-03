# infra
variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "profile" {
  type        = string
  default     = "terraform"
  description = "Which AWS profile from credentials file terraform should use"
}



# project
variable "project_name" {
  type    = string
  default = "bluebird-hotel"
}

variable "ssh_key" {
  type    = string
  default = "~/.ssh/brainscale.pub"
}



# network 
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "az" {
  type    = list(string)
  default = ["eu-north-1a", "eu-north-1b"]
}

variable "subnets_per_az" {
  type = map(number)
  default = {
    private = 1
    public  = 1
  }
}

variable "my_ip" {
  type    = list(string)
  default = ["217.113.25.0/24"]
}



# image
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



# database
variable "db_name" {
  type    = string
  default = "bluebirdhotel"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "8.4.6"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_storage_type" {
  type    = string
  default = "gp2"
}



# asg
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "image_tag" {
  description = "Docker image tag to pull"
  type        = string
  default     = "1.0"
}

variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
  default     = 0
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 2
}

variable "cpu_target_value" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 75
}

# Network module
module "network" {
  source = "./modules/network"

  project_name   = var.project_name
  vpc_cidr       = var.vpc_cidr
  az             = var.az
  subnets_per_az = var.subnets_per_az
}

# IAM module
module "instance_profile" {
  source = "./modules/instance_profile/"
}

# Security module
module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  my_ip        = var.my_ip
}

# Bastion module
module "bastion" {
  source = "./modules/bastion"

  project_name         = var.project_name
  ssh_key_path         = var.ssh_key
  ami_id               = data.aws_ami.amazon_linux.id
  instance_type        = "t3.micro"
  public_subnet_id     = module.network.public_subnet_ids[0]
  security_group_id    = module.security.bastion_sg_id
  iam_instance_profile = module.instance_profile.ec2_profile.name
}

# RDS module
module "database" {
  source = "./modules/database/"

  project_name            = var.project_name
  db_name                 = var.db_name
  db_username             = var.db_username
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_instance_class       = var.db_instance_class
  db_allocated_storage    = var.db_allocated_storage
  db_storage_type         = var.db_storage_type
  private_subnet_ids      = module.network.private_subnet_ids
  vpc_security_group_id   = module.security.rds_sg_id
  backup_retention_period = 1
  skip_final_snapshot     = true
  publicly_accessible     = false

}

# ECR module
module "ecr" {
  source = "./modules/ecr/"

  project_name = var.project_name
}

# ALB Module
module "alb" {
  source = "./modules/load_balancer/"

  project_name      = var.project_name
  security_group_id = module.security.alb_sg_id
  public_subnet_ids = module.network.public_subnet_ids
  vpc_id            = module.network.vpc_id

  health_check_enabled             = true
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 2
  health_check_timeout             = 5
  health_check_interval            = 30
  health_check_path                = "/"
  health_check_matcher             = "200"

  target_group_port     = 80
  target_group_protocol = "HTTP"
  # deregistration_delay  = 30
  #
  # listener_port     = 80
  # listener_protocol = "HTTP"
  #
  # alb_internal                   = false
  # alb_enable_deletion_protection = false
}

# ASG
module "asg" {
  source = "./modules/asg"

  project_name              = var.project_name
  ami_id                    = data.aws_ami.amazon_linux.id //change to my image.id
  instance_type             = var.instance_type
  iam_instance_profile_name = module.instance_profile.ec2_profile.name
  security_group_id         = module.security.ec2_sg_id
  private_subnet_ids        = module.network.private_subnet_ids
  target_group_arn          = module.alb.target_group_arn

  # ECR & Database configuration
  ecr_repository_url         = module.ecr.ecr_repository_url
  image_tag                  = var.image_tag
  region                     = var.region
  db_host                    = module.database.db_instance_address
  db_name                    = var.db_name
  db_user                    = var.db_username
  secrets_manager_secret_arn = module.database.secrets_manager_secret_arn


  # Scaling configuration
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
  asg_desired_capacity = var.asg_desired_capacity
  cpu_target_value     = var.cpu_target_value

  # depends_on = [module.load_balancer, module.database]
  depends_on = [module.database]
}

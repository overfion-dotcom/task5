resource "aws_ecr_repository" "app_repository" {
  name                 = "${var.project_name}-repository"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name = "${var.project_name}-repository"
  }
}

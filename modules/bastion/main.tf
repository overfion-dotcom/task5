resource "aws_key_pair" "bastion_key" {
  key_name   = "${var.project_name}-bastion-key"
  public_key = file(var.ssh_key_path)
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.bastion_key.key_name
  iam_instance_profile        = var.iam_instance_profile

  tags = {
    Name = "${var.project_name}-bastion-host"
  }
}

resource "aws_instance" "app" {
  count           = 1
  ami             = var.ami-id
  key_name        = aws_key_pair.deployer.key_name
  instance_type   = "t3.medium"
  subnet_id       = aws_subnet.subnet-main.id
  ebs_optimized   = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.public_api.id]
  tags = {
    Name = "app"
  }
}

resource "aws_eip" "app" {
  instance = aws_instance.app[0].id
  vpc      = true
}


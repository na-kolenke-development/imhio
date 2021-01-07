resource "aws_instance" "db" {
  count           = 1
  ami             = var.ami-id
  key_name        = aws_key_pair.deployer.key_name
  instance_type   = "t3.medium"
  subnet_id       = aws_subnet.subnet-main.id
  ebs_optimized   = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.mysql.id]
  tags = {
    Name = "db"
  }
}

resource "aws_ebs_volume" "db" {
  availability_zone = "eu-central-1a"
  size              = 20
}

resource "aws_volume_attachment" "db" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.db.id
  instance_id = aws_instance.db[0].id
}

resource "aws_eip" "db" {
  instance = aws_instance.db[0].id
  vpc      = true
}


resource "aws_instance" "example" {
  count           = 2
  ami             = "ami-08b6d44b4f6f7b279"
  key_name        = aws_key_pair.deployer.key_name
  instance_type   = "t3.medium"
  subnet_id       = aws_subnet.subnet-main.id
  ebs_optimized   = true
  security_groups = [aws_security_group.allow_ssh.id]
}

resource "aws_eip" "eip1" {
  instance = aws_instance.example[0].id
  vpc      = true
}

resource "aws_eip" "eip2" {
  instance = aws_instance.example[1].id
  vpc      = true
}

#resource "aws_network_interface" "eni1" {
#  subnet_id       = aws_subnet.subnet-main.id
#  private_ips     = ["10.0.0.1"]
#
#  attachment {
#    instance     = aws_instance.example[0].id
#    device_index = 1
#  }
#}

#resource "aws_network_interface" "eni2" {
#  subnet_id       = aws_subnet.subnet-main.id
#  private_ips     = ["10.0.0.2"]
#
#  attachment {
#    instance     = aws_instance.example[1].id
#    device_index = 1
#  }
#}

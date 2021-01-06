resource "aws_instance" "example" {
  ami             = "ami-08b6d44b4f6f7b279"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh.name]
}

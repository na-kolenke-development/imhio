resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "this" {
  cidr_block = "10.0.0.0/16"
  vpc_id = aws_vpc.main.id
  availability_zone = "eu-central-1a"
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-main.id
  }
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.subnet-main.id
  route_table_id = aws_route_table.route-table-main.id
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.ssh-key
}

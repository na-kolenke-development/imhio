resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-main" {
  cidr_block = "10.0.0.0/16"
  vpc_id = aws_vpc.main.id
  availability_zone = "eu-central-1a"
}

resource "aws_internet_gateway" "gw-main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "route-table-main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-main.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-main.id
  route_table_id = aws_route_table.route-table-main.id
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDA8krVo3NlA7el7qHdz4DA/bR+pJ2cDVhK94k8ExMcPFII3iwB3YSBuzN7zlL9YhD1eW/4mYhigu5qRkumo43V5sx1w4DFwAWZF5CDWWc2wruNu22xJjKfpyBAUjH+Bz6YyGy/x+VGrohIfY5LqPUqeBFopjYcoSx/OOmpLqIp+VJrYWaLLdFfAwaurswnqYWIdVjPRnWgKw2W76hAAWxJEIJf0luNptJeS27vQtYdr3zqdjJamDz2hRSqwa0YJ2QYlPq5N+XIns+PfLMAhR0BtWEkHYoB4lkPiZKQsxlO77wKbvV36VyHCwsEHRViPqsiaqkd/DsCTzJVjlrvn7sE9F4IaoH53oPBvGcMUO+vUZZHFPUfJWWl6Rqm+s7tm92PGKntJiHcAo/FZLOmUGzfUJd8S8ey6QtRSvIB8Ez8ZSkA2rfhtr+Cd4maOJm5hG8QM77PhtIBoPhuE39drZeSeYLtX7lqbzg+Tjzr730q0UpGOXQNh5tzvgYLM98Btgk= denis42914@centos8"
}

output "ip1" {
  value = aws_eip.eip1.public_ip
}

output "ip2" {
  value = aws_eip.eip2.public_ip
}

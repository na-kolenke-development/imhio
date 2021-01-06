output "app_public_ip" {
  value = aws_eip.app.public_ip
}

output "db_public_ip" {
  value = aws_eip.db.public_ip
}

output "ami-instance-public-ip"{
  value = aws_instance.ami-instance.public_ip
}

output "ami-instance-id"{
  value = aws_instance.ami-instance.id
}

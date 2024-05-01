output "project-vpc-id"{
  value = aws_vpc.project.id
}

output "db-sub-1-id"{
  value = aws_subnet.db1.id
}

output "db-sub-2-id"{
  value = aws_subnet.db2.id
}

output "db-sg-id"{
  value = aws_security_group.db-sg.id
}

output "webserver-subnet1-id"{
  value = aws_subnet.webserver1.id
  }

output "webserver-subnet2-id" {
  value = aws_subnet.webserver2.id
}

output "webserver-sg-id" {
  value = aws_security_group.webserver-sg.id
  }
output "alb-sg-id" {
  value = aws_security_group.alb-sg.id
}

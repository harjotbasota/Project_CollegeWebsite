resource "aws_vpc" "project" {
  cidr_block = var.vpc_cidr
  tags ={
     Name= "Project"
     }
}

resource "aws_subnet" "webserver1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = var.webserver_subnet1_cidr

  tags = {
    Name = "webserver-sub-1"
  }
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "webserver2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = var.webserver_subnet2_cidr

  tags = {
    Name = "webserver-sub-2"
  }
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "db1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = var.db_subnet1_cidr

  tags = {
    Name = "db-sub-1"
  }
  availability_zone = "us-east-1c"
}

resource "aws_subnet" "db2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = var.db_subnet2_cidr

  tags = {
    Name = "db-sub-2"
  }
  availability_zone = "us-east-1d"
}



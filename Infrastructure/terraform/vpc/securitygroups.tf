resource "aws_security_group" "db-sg" {
  name = "project-db-sg"
  description = "Allow Connection on db port"
  vpc_id      = aws_vpc.project.id

  tags = {
    Name = "project-db-sg"
  }
}

resource "aws_security_group" "webserver-sg" {
  description = "Allow HTTP connection on port 80 for load balancer"
  vpc_id      = aws_vpc.project.id
  name  = "project-ws-sg"
  tags = {
    Name = "project-ws-sg"
  }
}

resource "aws_security_group" "alb-sg" {
  description = "Allow Public access on port 80"
  vpc_id      = aws_vpc.project.id
  name = "project-alb-sg"
  tags = {
    Name = "project-alb-sg"
  }
}

resource "aws_security_group_rule" "alb-inbound" {
  type              = "ingress"
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  security_group_id = aws_security_group.alb-sg.id
}

resource "aws_security_group_rule" "alb-outbound" {
  type              = "egress"
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  security_group_id = aws_security_group.alb-sg.id
}

resource "aws_security_group_rule" "ws-outbound" {
  type              = "egress"
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  security_group_id = aws_security_group.webserver-sg.id
}
resource "aws_security_group_rule" "ws-sm-outbound" {
  type              = "egress"
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  security_group_id = aws_security_group.webserver-sg.id
}

resource "aws_security_group_rule" "ws-inbound" {
  type              = "ingress"
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.alb-sg.id
  from_port         = 80
  security_group_id = aws_security_group.webserver-sg.id
}

resource "aws_security_group_rule" "db-inbound" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  self              = true
  from_port         = 5432
  security_group_id = aws_security_group.db-sg.id
}

resource "aws_security_group_rule" "db-outbound" {
  type              = "egress"
  to_port           = 5432
  protocol          = "tcp"
  self              = true
  from_port         = 5432
  security_group_id = aws_security_group.db-sg.id
}

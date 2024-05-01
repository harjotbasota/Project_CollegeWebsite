resource "aws_lb_target_group" "project-tg" {
  name     = "project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.project-vpc-id
  target_type = "instance"
  ip_address_type = "ipv4"
  health_check {
    enabled = true
    path = "/"
    protocol = "HTTP"
 }
}

resource "aws_lb" "project-alb" {
  name               = "project-alb"
  internal           = false
  load_balancer_type = "application"
  tags = {
    Name = "project-alb"
  }
  ip_address_type = "ipv4"
  subnets = [data.terraform_remote_state.vpc.outputs.webserver-subnet1-id,data.terraform_remote_state.vpc.outputs.webserver-subnet2-id]
   security_groups = [data.terraform_remote_state.vpc.outputs.alb-sg-id]
  }

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.project-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project-tg.arn
  }
}


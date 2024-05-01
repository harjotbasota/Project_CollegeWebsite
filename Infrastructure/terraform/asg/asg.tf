resource "aws_autoscaling_group" "project-asg" {
  name = "project-asg"
  launch_template  {
    id = aws_launch_template.project-template.id
    version = "$Latest"
  }
  vpc_zone_identifier=[data.terraform_remote_state.vpc.outputs.webserver-subnet1-id,data.terraform_remote_state.vpc.outputs.webserver-subnet1-id]
  target_group_arns = [aws_lb_target_group.project-tg.arn]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 5
  }

resource "aws_autoscaling_policy" "asg-policy" {
  autoscaling_group_name = aws_autoscaling_group.project-asg.name
  name = "asg-policy"
  policy_type    = "TargetTrackingScaling"
  target_tracking_configuration {
  predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
  }
  target_value = 70
 }
}

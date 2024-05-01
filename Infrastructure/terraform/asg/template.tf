resource "aws_launch_template" "project-template" {
  name = "project-template"
  tags = {
     Name = "project-template"
  }
  image_id = data.terraform_remote_state.ami-builder.outputs.golden-image-id
  instance_type = "t2.micro"
  network_interfaces {
     associate_public_ip_address = true
     security_groups = [data.terraform_remote_state.vpc.outputs.webserver-sg-id,data.terraform_remote_state.vpc.outputs.db-sg-id]
  }
}

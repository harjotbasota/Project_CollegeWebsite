resource "aws_instance" "ami-instance" {
   tags = {
     Name = "ami-instance"
   }
   ami = var.ubuntu-ami
   instance_type = "t2.micro"
   key_name = var.ssh_key_name
   subnet_id = data.terraform_remote_state.vpc.outputs.webserver-subnet1-id
   associate_public_ip_address = true
   vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.webserver-sg-id,data.terraform_remote_state.vpc.outputs.db-sg-id,aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_ssh" {
  description = "Allow access on port 22"
  vpc_id      = data.terraform_remote_state.vpc.outputs.project-vpc-id
  name = "allow_ssh"
  tags = {
    Name = "project-ssh-sg"
  }
}

resource "aws_security_group_rule" "ssh-inbound" {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  security_group_id = aws_security_group.allow_ssh.id
}

resource "aws_security_group_rule" "ssh-outbound" {
  type              = "egress"
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  security_group_id = aws_security_group.allow_ssh.id
}

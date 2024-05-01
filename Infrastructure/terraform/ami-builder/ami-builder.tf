resource "aws_ami_from_instance" "golden-ami" {
  name               = "golden-ami"
  source_instance_id = data.terraform_remote_state.ami.outputs.ami-instance-id
}

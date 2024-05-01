resource "aws_db_subnet_group" "project-subgrp" {
  name       = "project-subnet-group"
  subnet_ids = [data.terraform_remote_state.vpc.outputs.db-sub-1-id,data.terraform_remote_state.vpc.outputs.db-sub-2-id]

  tags = {
    Name = "Project-db-subgrp"
  }
}

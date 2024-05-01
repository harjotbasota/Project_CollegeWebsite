resource "aws_db_instance" "project-rds" {
  engine = "postgres"
  multi_az = false
  db_name = "users"
  username = "postgres"
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.project-kms.id
  instance_class                = "db.t3.micro"
  storage_type  = "gp2"
  allocated_storage = 20
  max_allocated_storage = 0
  db_subnet_group_name = aws_db_subnet_group.project-subgrp.id
  publicly_accessible = false
  vpc_security_group_ids =  [data.terraform_remote_state.vpc.outputs.db-sg-id]
  port = 5432
  tags = {
    Name = "project-rds"
    }
  identifier = "project-rds"
  skip_final_snapshot = true
}

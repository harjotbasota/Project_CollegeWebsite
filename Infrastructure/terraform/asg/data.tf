data "terraform_remote_state" "ami-builder"{
  backend = "local"

  config = {
   path = "../ami-builder/terraform.tfstate"
   }
}
data "terraform_remote_state" "vpc"{
  backend = "local"

  config = {
   path = "../vpc/terraform.tfstate"
   }
}
data "terraform_remote_state" "ami"{
  backend = "local"

  config = {
   path = "../ami/terraform.tfstate"
   }
}

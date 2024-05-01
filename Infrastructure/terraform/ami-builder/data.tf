data "terraform_remote_state" "ami"{
  backend = "local"

  config = {
   path = "../ami/terraform.tfstate"
   }
}

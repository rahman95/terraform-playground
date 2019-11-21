terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-playground-remote"
    key     = "state/terraform.tfstate"
    region  = "eu-west-2"
  }
}

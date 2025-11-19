terraform {
  backend "s3" {
    bucket = "pgr301-terraform-state"
    key    = "kandidat34/state.tfstate"
    region = "eu-west-1"
  }
}
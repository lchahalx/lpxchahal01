terraform {
  backend "s3" {
    bucket       = "lchahal-tfstate-01"
    key          = "prod/terraform.tfstate"
    region       = "us-east-1"
    profile      = "lchahal"
    use_lockfile = true
  }
}
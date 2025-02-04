provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "s3" {
    bucket = "cornelia-test"
    region = "ap-southeast-1"
    key = "cornelia-key-pair" # must be different from other projects
  }
}
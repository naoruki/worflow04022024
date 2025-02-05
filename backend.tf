provider "aws" {
  region = "ap-southeast-1"
}
# terraform {
#   backend "s3" {
#     bucket = "sctp-ce8-tfstate"
#     region = "ap-southeast-1"
#     key = "cornelia-activity.tfstate" # must be different from other projects
#   }
# }
# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "cornelia-s3-bucket" # Replace with your desired bucket name

  tags = {
    Name        = "CorneliaS3Bucket"
    Environment = "Production"
  }
}
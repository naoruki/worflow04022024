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
  bucket = "cornelia-s3-bucket"

  tags = {
    Name        = "CorneliaS3Bucket"
    Environment = "Production"
  }
}

# Attach a bucket policy to allow delete permissions
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"  # Allow access for all users (Modify if needed)
        Action = [
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:DeleteBucket"
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.my_bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.my_bucket.id}/*"
        ]
      }
    ]
  })
}

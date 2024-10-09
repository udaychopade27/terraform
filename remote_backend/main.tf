terraform {
  required_providers {
    aws = {
            source = "hashicorp/aws"
            version = "~> 5.0.0"
        }
  }
}

resource "aws_s3_bucket" "bucket" {
    bucket_prefix = "devops-bucket-123" 
}
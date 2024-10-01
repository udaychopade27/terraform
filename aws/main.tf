terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0.0"
        }
    }
}

provider "aws"  {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "devops-bucket-uday"
    force_destroy = true
    versioning {
        enabled = false
    }
}

resource "aws_s3_bucket_lifecycle_configuration" "my_bucket_lifecycle" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    id     = "expire-objects"
    status = "Enabled"

    filter {
      prefix = ""  # Apply to all objects
    }
    expiration {
      days = 7
    }
  }
}

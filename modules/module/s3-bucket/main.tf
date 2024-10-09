resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
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

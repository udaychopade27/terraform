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

resource "aws_instance" "Instance_1" {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "t2.micro"
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}


output "instance_public_ip" {
  value = aws_instance.Instance_1.public_ip
}
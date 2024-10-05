terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0.0"
        }
    }
}

provider "aws"  {
    region = var.region
}

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
data "aws_vpc" "default_vpc" {
  default = true
}


resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}




resource "aws_instance" "Instance_1" {
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.instances.id]
    user_data = <<-EOF
              #!/bin/bash
              sudo yum install python3 -y
              mkdir -p /var/www/html
              echo "Hello, World!" > /var/www/html/index.html
              python3 -m http.server 8080 &
              EOF
}



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
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "test" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.test.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_instance" "Instance_1" {
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.test.id]
    user_data = <<-EOF
              #!/bin/bash
              sudo yum install python3 -y
              mkdir -p /var/www/html
              echo "Hello, World!" > /var/www/html/index.html
              python3 -m http.server 8080 &
              EOF
}



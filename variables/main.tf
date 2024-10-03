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

resource "aws_instance" "Instance_1" {
    ami           = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}

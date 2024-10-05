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
    vpc_security_group_ids = [aws_security_group.instances.id]
    user_data = <<-EOF
              #!/bin/bash
              sudo yum install python3 -y
              mkdir -p /var/www/html
              echo "Hello, World!" > /var/www/html/index.html
              python3 -m http.server 8080 &
              EOF
}
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

module "consul" {
    source = "https://github.com/hashicorp/terraform-aws-consul.git"
}
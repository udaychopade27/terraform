provider "aws" {
    region = "us-east-1"
}

module "ec2_instance" {
    source = "./module/ec2-instance" 
    ami_value = var.ami_value
    instance_type = var.instance_type
}

module "s3_bucket" {
    source = "./module/s3-bucket"
    bucket_name = "uday-devops-123"
}




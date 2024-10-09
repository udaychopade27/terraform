terraform {
  backend "s3" {
    bucket = "terraform-s3-bucket-uc123"
    key = "instance/terraform.tfstate"
    region = "ap-south-1"
  }
}
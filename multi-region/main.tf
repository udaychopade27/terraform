provider "aws" {
    alias = "us-east-1"
    region = "us-east-1"
}
provider "aws" {
    alias = "us-west-1"
    region = "us-west-1"
}
resource "aws_instance" "Instance_1" {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "t2.micro"
    provider = "aws.us-east-1"
}
resource "aws_instance" "Instance_2" {
    ami           = "ami-0522ab6e1ddcc7055"
    instance_type = "t2.micro"
    provider = "aws.us-west-1"
}
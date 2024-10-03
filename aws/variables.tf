variable "ami" {
    description = "ami-id for ec2 instnce"
    type = string
}
variable "instance_type" {
    description = "instance type for our vm"
    type = string
    default = "t2-micro"
}
variable "region" {
    description = "region where we want to deploy our vm"
    type = string
    default = "ap-south-1"
}
variable "bucket_name" {
    description = "name of s3 bucket"
    type = string
}
variable "instance_name" {
    description = "name for an instance"
    type = string
}
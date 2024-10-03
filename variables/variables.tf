variable "instance_name" {
    type = string
    description = "name Of ec2 instance"
}

variable "instance_type" {
    type = string
    description = "type of ec2 instnce"
    default = "t2.micro"
}

variable "ami" {
    type = string
    description = "ami-id ec2 instance"
}

variable "region" {
    type = string
    description = "region where we want to create ec2 instance"
}
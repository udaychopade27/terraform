output "instance_public_ip" {
  value = aws_instance.Instance_1.public_ip
}

output "instance_private_ip" {
  value = aws_instance.Instance_1.private_ip
}


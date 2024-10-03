output "instance_public_ip" {
  value = aws_instance.Instance_1.public_ip
}

output "s3_bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}
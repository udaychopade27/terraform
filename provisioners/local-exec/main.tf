resource "null_resource" "example" {
    triggers = {
        always_run = "${timestamp()}"    
    }
    provisioner "local-exec" {
      command = "echo 'this is local command'"
    }
  
}
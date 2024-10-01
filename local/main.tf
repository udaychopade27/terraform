terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "~> 2.5.0"
        }
    }
}

provider local{}

resource "local_file" "file" {
    filename = "file.txt"
    content = "This is sample file created using terraform"
}

output "local_file_content" {
    value = local_file.file.content
} 


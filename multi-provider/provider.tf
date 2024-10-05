terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0.0"
        }

        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
}
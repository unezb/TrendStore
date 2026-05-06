provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.0" }
    helm       = { source = "hashicorp/helm", version = "2.12.1" }
    http       = { source = "hashicorp/http", version = "~> 3.0" }
  }

  required_version = ">=1.0"
}
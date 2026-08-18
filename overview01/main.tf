terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "terraform-course"
}

resource "aws_instance" "example" {
  ami           = "ami-0ac7b260cf76d8865"
  instance_type = "t3.micro"
}

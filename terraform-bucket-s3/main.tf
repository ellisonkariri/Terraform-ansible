terraform {
  required_version = ">= 0.12"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }

}


provider "aws" {
  #escolha da região 
  region  = var.aws_region
  profile = var.aws_profile
}
resource "aws_instance" "web" {
  ami           = var.instace_ami
  instance_type = var.aws_type

  tags = var.aws_tags
}






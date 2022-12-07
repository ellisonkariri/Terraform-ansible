terraform {
  required_version = ">= 0.12"

# Selecionando o cloud provider 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }

}

# Escolhendo a região do cloud provider 

provider "aws" {
  #escolha da região 
  region  = var.aws_region
  profile = var.aws_profile
}

# Criando uma VPC 

resource "aws_security_group" "estudo-av4" {
  name        = "estudo-av4"
  description = "estudo-av4-"
  vpc_id      = "vpc-0f2e6b02f11eab6fe"

# Liberando a porta 443 
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

# Liberando a porta 80

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

# Liberando acesso remoto RDP porta 3389

  ingress {
    description      = "TLS from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

# Libernado porta HTTP WinRM 
  ingress {
    description      = "TLS from VPC"
    from_port        = 5985
    to_port          = 5985
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Add Tags 

  tags = {
    Name = "allow_tls"
  }




}

# Pegando as configurações das Variasveis 

resource "aws_instance" "web" {
  ami             = var.instace_ami
  instance_type   = var.aws_type
  tags            = var.aws_tags
  security_groups = [aws_security_group.estudo-av4.name]
  key_name = "win-server"
}






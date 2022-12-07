# Ambiente  
variable "envinroment" {
  type        = string
  description = ""
}
# Definindo região aws
variable "aws_region" {
  type        = string
  description = "Região"
}
# Definindo profile 
variable "aws_profile" {
  type        = string
  description = "profile"
}
# Pegando o instancia EC2
variable "instace_ami" {
  type        = string
  description = "instace_EC2"
}
# Selecionando o tipo de instancia 
variable "aws_type" {
  type        = string
  description = "instace-type"
}

#Tag para o nome do projeto
variable "aws_tags" {
  type = map(string)
  default = {
    Name    = "Windows Server 2019"
    Project = "AV4"
  }
  description = "instace-tags"
}


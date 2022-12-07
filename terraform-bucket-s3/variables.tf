variable "envinroment" {
  type        = string
  description = ""
}

variable "aws_region" {
  type        = string
  description = "Região"
}

variable "aws_profile" {
  type        = string
  description = "profile"
}

variable "instace_ami" {
  type        = string
  description = "instace_EC2"
}

variable "aws_type" {
  type        = string
  description = "instace-type"
}

variable "aws_tags" {
  type = map(string)
  default = {
    Name    = "Windows Server 2019"
    Project = "AV4"
  }
  description = "instace-tags"
}


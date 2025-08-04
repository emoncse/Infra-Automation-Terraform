variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "public_key_path" {
  type        = string
  description = "SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile name"
  default     = "imran_profile"
}


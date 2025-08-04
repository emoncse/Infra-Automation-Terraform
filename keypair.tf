resource "aws_key_pair" "ssh_key" {
  key_name   = "tf-ap-south1-key"
  public_key = file(var.public_key_path)
}


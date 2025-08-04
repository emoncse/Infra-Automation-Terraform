locals {
  user_data = <<-EOF
    #!/bin/bash
    set -euxo pipefail
    dnf -y update
    dnf -y install httpd python3 git
    systemctl enable --now httpd
    echo "<h1>Hello from Terraform (Mumbai)!</h1>" > /var/www/html/index.html
  EOF
}

resource "aws_instance" "web" {
  ami                         = data.aws_ssm_parameter.al2023_ami.value
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data                   = local.user_data
  associate_public_ip_address = true

  tags = {
    Name = "tf-mumbai-web"
  }
}


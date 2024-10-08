provider "aws" {
  region = "eu-north-1"  
}

terraform {
  backend "s3" {
    bucket         = "sdineshgandhi"
    key            = "terraform/state/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}

resource "aws_instance" "ubuntu1" {
  ami             = "ami-08eb150f611ca277f"
  instance_type   = "t3.micro"
  key_name        = "mykeypair"

  subnet_id                     = "subnet-074ad2674618bb6e5"
  associate_public_ip_address    = true
  vpc_security_group_ids         = ["sg-0651cc7fbf8f21339"]

  tags = {
    Name = "My-EC2-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.ubuntu1.public_ip
  description = "The public IP address of the EC2 instance"
}
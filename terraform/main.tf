provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ml_server" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "MLServer"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user"
    ]
  }

  key_name = "bilia1pem"
}

resource "aws_s3_bucket" "ml_data" {
  bucket = "ml-generative-data-001"
}

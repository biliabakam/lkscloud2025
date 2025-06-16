provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ml_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

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

  key_name = "your-key"
}

resource "aws_s3_bucket" "ml_data" {
  bucket = "ml-generative-data-001"
}
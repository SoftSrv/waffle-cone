provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.AMI_ID}"
  instance_type = "t2.micro"
  key_name = "common-key"

  provisioner "local-exec" {
    command = "export PUBLIC_IP=${aws_instance.example.public_ip}"
  }
  provisioner "remote-exec" {
    inline = [
      "docker run -d softsrv/minecraft:1.12",
    ]

    connection {
      user     = "ec2-user"
      private_key = "${var.PEM_KEY}"
    }
  }
}

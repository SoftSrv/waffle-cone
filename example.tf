provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.AMI_ID}"
  instance_type = "t2.micro"
  key_name = "common-key"

  provisioner "local-exec" {
    command = "echo \"versionName=${aws_instance.example.public_ip}\" >> ${var.JOB_ENV_FILE}"
  }

  provisioner "remote-exec" {
    inline = [
      "docker run -d -p 25565:25565 softsrv/minecraft:1.12",
    ]

    connection {
      user     = "ec2-user"
      private_key = "${file(var.PEM_KEY)}"
    }
  }

  output "machine_ip" {
    value = "${aws_instance.example.public_ip}"
   }
}

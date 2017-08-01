provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.AMI_ID}"
  instance_type = "t2.micro"
}

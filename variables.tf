variable "region" {
  default = "us-east-1"
}

variable "AMI_ID" {
  default = "ami-2757f631"
}

variable "PEM_KEY" {
  default = "hello"
}

variable "JOB_ENV_FILE" {
  default = "/build/state/provision.env"
}

variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

variable "ZONE3" {
  default = "us-east-2c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0231217be14a6f3ba"
    us-east-1 = "ami-0a8b4cd432b1c3063"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PRIV_KEY" {
  default = "dovekey"
}

variable "PUB_KEY" {
  default = "dovekey.pub"
}

variable "MYIP" {
  default = "106.195.11.240/32"
}
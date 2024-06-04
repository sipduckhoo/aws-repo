variable "region" {
    type = string
    default = "us-west-2"  
}

variable "ami"{
    type = string
    default = "ami-06068bc7800ac1a83"
}

variable "inst-type" {
    type = string
    default = "t2.micro"
}
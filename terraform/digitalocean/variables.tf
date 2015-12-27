variable "key_file" {
  description = "The ssh public key for using with the cloud provider."
  default = "~/.ssh/id_rsa.pub"
}

variable "pvt_key_file" {
  description = "The ssh pvt key for using with the cloud provider."
  default = "~/.ssh/id_rsa"
}

variable "region" {
  description = "The Digital Ocean region to create resources in."
  default = "sgp1"
}

variable "masters" {
  description = "The number of masters."
  default = "2"
}

variable "slaves" {
  description = "The number of slaves."
  default = "3"
}

variable "instance_type" {
  default = {
    master = "512mb"
    slave  = "1gb"
  }
}

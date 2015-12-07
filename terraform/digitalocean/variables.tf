variable "key_file" {
  description = "The ssh public key for using with the cloud provider."
  default = "~/.ssh/id_rsa.pub"
}

variable "pvt_key_file" {
  description = "The ssh pvt key for using with the cloud provider."
  default = "~/.ssh/id_rsa"
}

variable "do_token" {
  description = "The Digital Ocean token."
  default = "471174d71c8f3887bd9e282f6f660e5814067ae633e63c23d47c46b44ccb85fc"
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
    slave  = "512mb"
  }
}

variable "location" {
  description = "test"
  type        = string
  default     = "West Europe"

}

variable "sub_id" {

  default     = "628e279f-926f-43cc-bc30-24777c6b91ef"
  description = "sub ID"
  type        = string

}

variable "resource_group" {

  default = "RG-Dipak"
  type    = string

}

variable "vnet" {

  type        = list(string)
  default     = ["vnet1", "vnet2"]
  description = "vnet names"

}

variable "address" {
  type        = list(string)
  default     = ["10.10.2.0/24", "10.10.3.0/24"]
  description = "adresses"
}

variable "env1" {
  type = map(string)
  default = {
    "prd-dipak" = "production"
    "dev-dipak" = "develpment"
  }
  description = "envs"
}

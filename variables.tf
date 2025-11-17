variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "sub_id" {
  type      = string
  sensitive = true
}

variable "admin_username" {
  type    = string
  default = "dipak"
}

variable "ssh_public_key_path" {
  type    = string
  default = "ssh/id_rsa.pub"
}

variable "username" {
  description = "Username of cisco device"
  type = string
}

variable "password" {
  description = "Password for accessing cisco device"
  type = string
  sensitive = true
}
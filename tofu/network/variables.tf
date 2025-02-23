variable "username" {
  type = string
  description = "Username to use for connection to Unifi control plane."
}

variable "password" {
  type = string
  description = "Password to use for connection to Unifi control plane."
}

variable "api_url" {
  type = string
  description = "URL to use for connection to Unifi control plane."
}

variable "insecure" {
  type = bool
  description = "Do not validate control plane certificate."
  default = false
}
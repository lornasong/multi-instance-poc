variable "services" {
  description = "Services that the instance cares about"
  type = map(object({
    # Name of the service
    name = string
    # Address for instance of the service
    address = string
  }))
}

variable "workspace" {
  description = "workspace name"
  type = string
  default = ""
}

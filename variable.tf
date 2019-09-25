variable "label" {
  type = "map"

  default = {
    namespace = "myself"
    stage     = "dev"
    name      = "mydomain"
  }
}

variable "zone_name" {}
#variable "vpc_name" {}
#variable "zone_name_local" {}

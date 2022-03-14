variable "length" {
  type    = number
  default = 5
}

variable "depends_on" {
  type    = string
  default = "0"
}

module "infra" {
  source        = "../../modules/random"
  length        = var.length
  refresh_token = var.depends_on
}

output "depends_on" {
  value = var.depends_on
}

output "infra_name" {
  value = "infra_mid_${module.infra.random_string}"
}
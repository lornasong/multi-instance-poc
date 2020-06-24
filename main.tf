terraform {
    required_version = ">=0.12"

    # Configuration block to use Consul as Terraform Backend
    # backend "consul" {
    #     address = "127.0.0.1:8500"
    #     scheme  = "http"
    #     path    = "network/terraform"
    # }
}

module "local" {
    source = "./modules/local"
    services = { for name in var.service_mapping[var.workspace] : name => var.services[name]}
}

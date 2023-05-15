# change this accordingly based on the module you consume
variable "token" {}
variable "secret" {}

module "instellar" {
  source = "upmaru/instellar/<hcloud|digitalocean|aws>"

  access_key   = var.token
  secret_key   = var.secret
  cluster_name = "<cluster_name>"
  node_size    = "<size>"
  cluster_topology = [
    { id = 1, name = "ham", size = "<size>" },
    { id = 2, name = "bacon", size = "<size>" },
  ]
  storage_size = 40
  ssh_keys = [
    "<key-name>"
  ]
}

output "trust_token" {
  value = module.instellar.trust_token
}

output "cluster_address" {
  value = module.instellar.cluster_address
}
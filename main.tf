module "vault" {
  source  = "app.terraform.io/burkey/virtual-machine/vsphere"
  version = "1.1.4"
  count             = var.count_index
  datacenter        = local.vsphere_data.datacenter
  cluster           = local.vsphere_data.cluster
  primary_datastore = local.vsphere_data.primary_datastore
  networks = {
    "${local.local_network}" : "dhcp"

  }
  # This will clone an existing packer template registered in vCenter
  template = "go-tfc-agent-small"

  hostname = "postgres-${count.index}"
  memory   = 4096

}
## Creates Vault DB secrets engine.
module "secrets-database" {
  source  = "app.terraform.io/burkey/secrets-database/vault"
  version = "0.0.3"
  database_name = "postgres"
  database_server_address =  module.vault[0].virtual_machine_ip
  project_id = var.project_id

}

# ## Grabs Boundary target for authentication
# module "target" {
#   source  = "app.terraform.io/burkey/target/boundary"
#   version = "0.0.1"
#   credential_store_id = var.credential_store_id
#   app_name = var.app_name
#   scope_id = var.scope_id
#   project_id = var.project_id
#   read_only_path = module.secrets-database.credential_path
#   target_address = module.vault[0].virtual_machine_ip
#   target_port = "5432"
# }
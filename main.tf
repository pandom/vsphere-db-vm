data "vsphere_datacenter" "dc" {
  name = local.vsphere_data.datacenter
}
module "vault" {
  source  = "app.terraform.io/burkey/virtual-machine/vsphere"
  version = "1.1.3"
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

terraform {
  # cloud {
  #   organization = "burkey"

  #   workspaces {
  #     name = "4-vsphere-db-vm"
  #   }
  # }
  required_providers {

    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
      version = "2.2.0"
    }
    vault = {
      source = "registry.terraform.io/hashicorp/vault"
      version = "3.11.0"
    }
    boundary = {
      source = "registry.terraform.io/hashicorp/boundary"
      version = "~>1"
    }

  }
}

provider "vault"{
  skip_tls_verify = true
}

provider "vsphere" {
  #vsphere_server = var.vsphere_server
  # Configuration options
}
provider "boundary" {
 addr = "https://6e26f70b-1a23-485a-8f30-48450d8b0ef3.boundary.hashicorp.cloud"
}

locals {
  vsphere_data  = var.vsphere_data[var.environment]
  local_network = "seg-general"
}
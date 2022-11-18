
variable "environment" {
  type    = string
  default = "production"
}

# variable "nsx_server" {}
# variable "vsphere_server" {}

variable "count_index" {
  type    = number
  default = 1
}

variable "tfc_networks_workspace_name" {
  default     = "tf-vsphere-nsx-quickstart-nocode"
  description = "name of nocode workspace"
}
variable "vsphere_data" {
  type = map(map(string))
  default = {
    "production" = {
      "datacenter"        = "Datacenter"
      "cluster"           = "Cluster"
      "primary_datastore" = "vsanDatastore"
    }
    # "development" = {
    #     "datacenter" = "Datacenter"
    #     #potentially use a different cluster for management workloads
    # 	"cluster" = "DevCluster"
    #     #potentially use a different datastore here
    # 	"primary_datastore" = "vsanDatastore2"
    # }
  }

}

output "vmip" {
  value = module.vault[0].vsphere_virtual_machine.default_ip_address
}

output "vmip" {
  value = module.vault[0].vsphere_virtual_machine.virtual_machine_ip
}
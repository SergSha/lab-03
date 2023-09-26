
output "iscsi-servers-info" {
  description = "General information about created VMs"
  value = {
    for vm in data.yandex_compute_instance.iscsi-servers : 
    vm.name => {
      ip_address = vm.network_interface.*.ip_address
      nat_ip_address = vm.network_interface.*.nat_ip_address
    }
  }
}

output "pcs-servers-info" {
  description = "General information about created VMs"
  value = {
    for vm in data.yandex_compute_instance.pcs-servers : 
    vm.name => {
      ip_address = vm.network_interface.*.ip_address
      nat_ip_address = vm.network_interface.*.nat_ip_address
    }
  }
}
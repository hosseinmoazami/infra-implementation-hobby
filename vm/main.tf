# Create Control Palane Node
module "control-plane-vm" {
  source             = "MonolithProjects/vm/libvirt"
  version            = "1.10.0"
  os_img_url         = var.os_img_url
  time_zone          = var.time_zone
  pool               = var.pool
  vm_hostname_prefix = var.cp_hostname_prefix
  vm_count           = var.cp_nodes_count
  memory             = var.cp_memory
  vcpu               = var.cp_vcpu
  system_volume      = var.cp_disk
  ip_address         = var.cp_ip_address
  dhcp               = var.dhcp
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_admin          = var.ssh_admin
  ssh_keys           = [
    file(var.ssh_public_key),
    ]
  depends_on = [resource.libvirt_pool.pool-vm]
}

module "workers-vm" {
  source             = "MonolithProjects/vm/libvirt"
  version            = "1.10.0"
  os_img_url         = var.os_img_url
  time_zone          = var.time_zone
  pool               = var.pool
  vm_hostname_prefix = var.worker_hostname_prefix
  vm_count           = var.worker_nodes_count
  memory             = var.worker_memory
  vcpu               = var.worker_vcpu
  system_volume      = var.worker_disk
  ip_address         = var.worker_ip_address
  dhcp               = var.dhcp
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_admin          = var.ssh_admin
  ssh_keys           = [
    file(var.ssh_public_key),
    ]
  depends_on = [resource.libvirt_pool.pool-vm]
}
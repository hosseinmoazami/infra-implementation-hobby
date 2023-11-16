# Create Control Palane Node
module "vm" {
  source             = "MonolithProjects/vm/libvirt"
  version            = "1.10.0"
  os_img_url         = var.os_img_url
  time_zone          = var.time_zone
  vm_hostname_prefix = var.vm_hostname_prefix
  vm_count           = var.vm_count
  memory             = var.memory
  vcpu               = var.vcpu
  pool               = var.pool
  system_volume      = var.system_volume
  dhcp               = var.dhcp
  ip_address         = var.ip_address
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  ssh_admin          = var.ssh_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_keys           = var.ssh_keys
}

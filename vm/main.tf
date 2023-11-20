# Create Control Palane Node
module "control-plane-vm" {
  source     = "MonolithProjects/vm/libvirt"
  version    = "1.10.0"
  os_img_url = var.os_img_url
  time_zone  = var.time_zone
  pool       = var.pool

  vm_hostname_prefix = var.vm_cp_config["hostname"]
  vm_count           = var.vm_cp_config["count"]
  memory             = var.vm_cp_config["memory"]
  vcpu               = var.vm_cp_config["vcpu"]
  system_volume      = var.vm_cp_config["disk"]
  ip_address         = var.vm_cp_ip_addr

  dhcp               = var.dhcp
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_admin          = var.ssh_admin
  ssh_keys = [
    file(var.ssh_public_key),
  ]
  depends_on = [resource.libvirt_pool.pool-vm]
}

module "workers-vm" {
  source  = "MonolithProjects/vm/libvirt"
  version = "1.10.0"

  os_img_url = var.os_img_url
  time_zone  = var.time_zone
  pool       = var.pool

  vm_hostname_prefix = var.vm_worker_config["hostname"]
  vm_count           = var.vm_worker_config["count"]
  memory             = var.vm_worker_config["memory"]
  vcpu               = var.vm_worker_config["vcpu"]
  system_volume      = var.vm_worker_config["disk"]
  ip_address         = var.vm_worker_ip_addr

  dhcp               = var.dhcp
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_admin          = var.ssh_admin
  ssh_keys = [
    file(var.ssh_public_key),
  ]
  depends_on = [resource.libvirt_pool.pool-vm]
}

module "builder-vm" {
  source  = "MonolithProjects/vm/libvirt"
  version = "1.10.0"

  os_img_url = var.os_img_url
  time_zone  = var.time_zone
  pool       = var.pool

  vm_hostname_prefix = var.vm_builder_config["hostname"]
  vm_count           = var.vm_builder_config["count"]
  memory             = var.vm_builder_config["memory"]
  vcpu               = var.vm_builder_config["vcpu"]
  system_volume      = var.vm_builder_config["disk"]
  ip_address         = var.vm_builder_ip_addr

  dhcp               = var.dhcp
  ip_gateway         = var.ip_gateway
  ip_nameserver      = var.ip_nameserver
  local_admin        = var.local_admin
  local_admin_passwd = var.local_admin_passwd
  ssh_admin          = var.ssh_admin
  ssh_keys = [
    file(var.ssh_public_key),
  ]
  depends_on = [resource.libvirt_pool.pool-vm]
}

resource "libvirt_pool" "pool-vm" {
  name = "vm"
  type = "dir"
  path = var.pool-vm-dir
}

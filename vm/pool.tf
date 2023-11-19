resource "libvirt_pool" "pool-vm" {
  name = "vm"
  type = "dir"
  path = "/home/hossein/w/arvan/interview/vm/storage/kvm/vm"
#   path = "${path.module}/${var.pool-vm-dir}"
}
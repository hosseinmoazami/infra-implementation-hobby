terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.4" // this version has problem with output
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh:///system"
}

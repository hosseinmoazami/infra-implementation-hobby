variable "os_img_url" {
  description = "URL to the OS image"
  type        = string
  default     = "./img/jammy-server-cloudimg-amd64.img" // in my local
  #   default     = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "time_zone" {
  description = "Time Zone"
  type        = string
  default     = "Asia/Tehran"
}

variable "vm_hostname_prefix" {
  description = "VM hostname prefix"
  type        = string
  default     = "node"
}

variable "vm_count" {
  description = "Number of VMs"
  type        = number
  default     = 3
}

variable "memory" {
  description = "RAM in MB"
  type        = string
  default     = "2048"
}

variable "vcpu" {
  description = "Number of vCPUs"
  type        = number
  default     = 2
}

variable "pool" {
  description = "Storage pool name"
  type        = string
  default     = "vm"
}

variable "system_volume" {
  description = "System Volume size (GB)"
  type        = number
  default     = 10
}

variable "bridge" {
  description = "Bridge interface"
  type        = string
  default     = "virbr0"
}

variable "dhcp" {
  description = "Use DHCP or Static IP settings"
  type        = bool
  default     = false
}

variable "ip_address" {
  description = "List of IP addresses"
  type        = list(string)
  default = [
    "192.168.122.200",
    "192.168.122.201",
    "192.168.122.202"
  ]
}

variable "ip_gateway" {
  description = "IP addresses of a gateway"
  type        = string
  default     = "192.168.122.1"
}

variable "ip_nameserver" {
  description = "IP addresses of a nameserver"
  type        = string
  default     = "192.168.122.1"
}

variable "local_admin" {
  description = "Admin user without ssh access"
  type        = string
  default     = "local-admin"
}

variable "local_admin_passwd" {
  description = "Local admin user password, out of command: mkpasswd -m sha-512 \"123456\""
  type        = string
  default     = "$6$Auox90sh.mnvcuJC$OqvpYApZI2gEus83X6yZvUFl7M3BUYq38FytJ3bnAykEOfwz.rTjQS6uicHWgpwXzZQXHK8AGJ9vPDh/ZZEWg0"
}

variable "ssh_admin" {
  description = "Admin user with ssh access"
  type        = string
  default     = "ssh-admin"
}

variable "ssh_keys" {
  description = "List of public ssh keys"
  type        = list(string)
  default     = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMmHCdpzeuhTYM+W9Jt5x6KaPQdNEGa1wnt5IM0nd4w hossein@Happy"]
}

variable "ssh_private_key" {
  description = "Private key for SSH connection test"
  type        = string
  default     = "~/.ssh/id_ed25519"
}

variable "autostart" {
  description = "Autostart the domain"
  type        = bool
  default     = true
}

variable "index_start" {
  description = "From where the indexig start"
  type        = number
  default     = 1
}

variable "cpu_mode" {
  description = "CPU mode"
  type        = string
  default     = "host-passthrough"
}

variable "share_filesystem" {
  type = object({
    source   = string
    target   = string
    readonly = bool
    mode     = string
  })
  default = {
    source   = null
    target   = null
    readonly = false
    mode     = null
  }
}

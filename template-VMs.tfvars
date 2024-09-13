# template-VMs.tfvars

# Standardwerte für alle VMs
# default_memory    = 8192
# default_cores  = 4
# default_disk_size = "100G"

vm_configurations = {
  "web-server-1" = { # VM-Name
    ip_address = "192.168.1.101"
    memory     = 4096
    cores      = 2
    disk_size  = "50G"
    cpu        = "host"
  }
  "database-server" = {
    ipv4_address = "192.168.1.102"
    memory       = 8192
    cores        = 4
    disk_size    = "100G"
  }
  "backup-server" = {
    ipv4_address = "192.168.1.103"
    memory       = 4096
    cores        = 2
    disk_size    = "50G"
  }
}

# Cloudinit
gateway    = "192.168.1.1"
dns1       = "8.8.8.8"
dns_search = "mydomain.local"

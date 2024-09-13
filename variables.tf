variable "provider_type" {
  description = "Provider type: vsphere or proxmox"
  type        = string
}

# Common variables
# variable "vm_name" {
#   description = "Name of the VM"
#   type        = string
# }
# variable "cores" {
#   description = "Number of CPUs for the VM"
#   type        = number
# }
variable "cpu" {
  description = "	The type of CPU to emulate in the Guest."
  type        = string
}
# variable "memory" {
#   description = "Memory size for the VM in MB"
#   type        = number
# }
# variable "disk_size" {
#   description = "Disk size for the VM in GB"
#   type        = number
# }
variable "gateway" {
  description = "Gateway for the VM"
  type        = string
}
variable "dns1" {
  description = "Primary DNS"
  type        = string
}
variable "dns_search" {
  description = "DNS search domain"
  type        = string
}
variable "ssh_private_key" {
  description = "SSH-Key path for 'pve_user'"
  type        = string
}

variable "vm_configurations" {
  description = "Map of VM configurations"
  type = map(object({
    ip_address = string
    memory     = number
    cores      = number
    disk_size  = string
  }))
  default = {} # Ermöglicht die Option, keine spezifischen Werte zu setzen
}

variable "default_memory" {
  description = "Default memory size for the VMs in MB"
  type        = number
  default     = 4096 # Standardwert, falls keiner angegeben ist
}

variable "default_cores" {
  description = "Default number of CPUs for the VMs"
  type        = number
  default     = 2
}

variable "default_disk_size" {
  description = "Default disk size for the VMs in GB"
  type        = string
  default     = "50G"
}


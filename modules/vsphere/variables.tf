# vSphere variables
variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
  default     = null
}
variable "vsphere_user" {
  description = "vSphere username"
  type        = string
  default     = null
}
variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
  default     = null
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
  type        = string
  default     = null
}

# Common variables
variable "vm_name" {
  description = "Name of the VM"
  type        = string
}
variable "num_cpus" {
  description = "Number of CPUs for the VM"
  type        = number
}
variable "memory" {
  description = "Memory size for the VM in MB"
  type        = number
}
variable "disk_size" {
  description = "Disk size for the VM in GB"
  type        = number
}
variable "ip_address" {
  description = "Static IP address for the VM"
  type        = string
}
variable "gateway" {
  description = "Gateway for the VM"
  type        = string
  default     = "192.168.1.1"
}
variable "dns1" {
  description = "Primary DNS server"
  type        = string
  default     = "192.168.2.53"
}
variable "dns_search" {
  description = "DNS search domain"
  type        = string
  default     = "mydomain.local"
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

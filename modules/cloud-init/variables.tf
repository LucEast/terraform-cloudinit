# Common variables
# variable "hostname" {
#   description = "Name of the VM"
#   type        = string
# }
# variable "ip_address" {
#   description = "Static IP address for the VM"
#   type        = string
# }
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

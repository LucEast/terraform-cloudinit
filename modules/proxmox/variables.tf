# Proxmox variables
variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}
variable "pve_host" {
  description = "Hostname/IP to connect with"
  type        = string
}
variable "pve_user" {
  description = "SSH-User for Proxmox"
  type        = string
}
variable "proxmox_user" {
  description = "Proxmox username"
  type        = string
  default     = null
}
variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
  default     = null
}
variable "proxmox_api_token_id" {
  description = "Proxmox API Token"
  type        = string
  default     = null
}
variable "proxmox_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  default     = null
}
variable "ssh_private_key" {
  description = "SSH-Key path for 'pve_user'"
  type        = string
}
variable "proxmox_node" {
  description = "The Proxmox node where the VM will be created"
  type        = string
}
variable "full_clone" {
  description = "Weather a full or linked clone"
  type        = bool
  default     = true
}
variable "agent" {
  description = "Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect."
  type        = number
}
variable "scsihw" {
  description = "The SCSI controller to emulate."
  type        = string
  default     = "virtio-scsi-single"
}
variable "network_model" {
  description = "Network model (e.g., virtio)"
  type        = string
  default     = "virtio"
}
variable "network_bridge" {
  description = "Network bridge to connect the VM"
  type        = string
  default     = "vmbr0"
}
variable "vm_state" {
  description = "Whether to start the VM after creation"
  type        = string
  default     = "started"
}

# Common variables
variable "cpu" {
  description = "	The type of CPU to emulate in the Guest."
  type        = string
}
variable "sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = "1"
}
variable "disk_storage" {
  description = "The name of the storage pool on which to store the disk."
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
variable "template_name" {
  description = "Name of the VM to clone"
  type        = string
}
variable "kvm" {
  description = "Weather kvm hardware acceleration should be used."
  type        = bool
}
variable "default_cpu" {
  description = "Default type of CPU to emulate in the Guest"
  type        = string
  default     = "host"
}
variable "protection" {
  description = "Protects VMs for deletion"
  type        = bool
  default     = false
}
variable "onboot" {
  description = "Whether to have the VM startup after the PVE node starts."
  type        = bool
  default     = false
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

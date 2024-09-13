# Proxmox variables
variable "proxmox_api_url" {
  description = "Proxmox API URL"
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
variable "pve_host" {
  description = "Hostname/IP to connect with"
  type        = string
}
variable "pve_user" {
  description = "SSH-User for Proxmox"
  type        = string
}
variable "template_name" {
  description = "Name of the VM to clone"
  type        = string
}
variable "agent" {
  description = "Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect."
  type        = number
  default     = 1
}
variable "proxmox_node" {
  description = "Proxmox node where the VM will be deployed"
  type        = string
}
variable "kvm" {
  description = "Weather kvm hardware acceleration should be used."
  type        = bool
}
variable "disk_storage" {
  description = "The name of the storage pool on which to store the disk."
  type        = string
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

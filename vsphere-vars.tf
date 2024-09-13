# vSphere variables
variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
}
variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}
variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
  type        = string
}

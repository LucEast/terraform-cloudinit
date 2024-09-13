# main.tf

terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.9.0"
    }
  }
}

module "vm_instance_proxmox" {
  source = "./modules/proxmox"

  vm_configurations        = var.provider_type == "proxmox" ? var.vm_configurations : {}
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  pve_host                 = var.pve_host
  pve_user                 = var.pve_user
  ssh_private_key          = var.ssh_private_key
  proxmox_user             = var.proxmox_user
  proxmox_password         = var.proxmox_password
  proxmox_node             = var.proxmox_node
  template_name            = var.template_name
  agent                    = var.agent
  kvm                      = var.kvm
  disk_storage             = var.disk_storage
  cpu                      = var.cpu

}

# module "vsphere_cloud_init" {
#   source   = "./modules/cloud-init"
#   for_each = var.provider_type == "vsphere" ? var.vm_configurations : {}

#   hostname   = each.key
#   ip_address = each.value.ip_address
#   gateway    = var.gateway
#   dns1       = var.dns1
#   dns_search = var.dns_search
# }

# module "vm_instance_vsphere" {
#   source   = "./modules/vsphere"
#   for_each = var.provider_type == "vsphere" ? var.vm_configurations : {}

#   vm_name            = each.key
#   ip_address         = each.value.ip_address
#   gateway            = var.gateway
#   dns1               = var.dns1
#   dns_search         = var.dns_search
#   vsphere_server     = var.vsphere_server
#   vsphere_user       = var.vsphere_user
#   vsphere_password   = var.vsphere_password
#   vsphere_datacenter = var.vsphere_datacenter

#   # Nutze den spezifischen Wert oder den Standardwert
#   memory    = lookup(each.value, "memory", var.default_memory)
#   num_cpus  = lookup(each.value, "num_cpus", var.default_cores)
#   disk_size = lookup(each.value, "disk_size", var.default_disk_size)
# }

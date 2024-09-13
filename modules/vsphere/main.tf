# TODO: https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs

terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.9.0"
    }
  }
}

provider "vsphere" {
  # Configuration options
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  api_timeout          = 10
}

module "cloud_init" {
  source            = "../cloud-init"
  vm_configurations = var.vm_configurations
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.vm_name
        domain    = "local"
      }

      network_interface {
        ipv4_address = var.ip_address
        ipv4_netmask = 24
      }

      # Use `replace_trigger for cloud-init # https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine#replace_trigger

    }
  }
}

# provider "vsphere" {
#   vsphere_server = var.vsphere_server
#   user           = var.vsphere_user
#   password       = var.vsphere_password
#   allow_unverified_ssl = true
# }

# resource "vsphere_virtual_machine" "vm" {
#   name             = var.vm_name
#   resource_pool_id = data.vsphere_resource_pool.pool.id
#   datastore_id     = data.vsphere_datastore.datastore.id
#   num_cpus         = var.num_cpus
#   memory           = var.memory
#   network_interface {
#     network_id = data.vsphere_network.network.id
#     adapter_type = "vmxnet3"
#   }
#   disk {
#     label            = "disk0"
#     size             = var.disk_size
#   }
# }

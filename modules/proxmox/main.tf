# ./modules/proxmox/main.tf

terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}


provider "proxmox" {
  pm_api_url = var.proxmox_api_url

  # Wenn Token-Authentifizierung vorhanden, nutze diese, sonst Username/Passwort
  pm_api_token_id     = var.proxmox_api_token_id != null && var.proxmox_api_token_secret != null ? var.proxmox_api_token_id : null
  pm_api_token_secret = var.proxmox_api_token_id != null && var.proxmox_api_token_secret != null ? var.proxmox_api_token_secret : null
  pm_user             = var.proxmox_api_token_id == null && var.proxmox_api_token_secret == null ? var.proxmox_user : null
  pm_password         = var.proxmox_api_token_id == null && var.proxmox_api_token_secret == null ? var.proxmox_password : null
}

module "cloud_init" {
  source            = "../cloud-init"
  vm_configurations = var.vm_configurations
}

resource "null_resource" "cloud_init_config_files" {

  for_each = var.vm_configurations

  connection {
    type        = "ssh"
    user        = var.pve_user
    private_key = file(var.ssh_private_key)
    host        = var.pve_host
  }

  provisioner "file" {
    source      = "${path.module}/../cloud-init/cloud-init-files/cloud-init-${each.key}.yaml"
    destination = "/tmp/user_data_vm-${each.key}.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/user_data_vm-${each.key}.yaml /var/lib/vz/snippets/user_data_vm-${each.key}.yaml",
      "sudo chown root:root /var/lib/vz/snippets/user_data_vm-${each.key}.yaml"
    ]
  }
}

resource "proxmox_vm_qemu" "vm" {
  for_each    = var.vm_configurations
  name        = each.key
  target_node = var.proxmox_node
  clone       = var.template_name
  full_clone  = var.full_clone
  agent       = var.agent

  # VM resources
  cores   = each.value.cores
  cpu     = var.cpu
  memory  = each.value.memory
  sockets = var.sockets

  # Network configuration

  ipconfig0    = "ip=${each.value.ip_address},gw=${var.gateway}"
  nameserver   = var.dns1
  searchdomain = var.dns_search

  # Cloud-Init settings
  cicustom = "user=local:snippets/user_data_vm-${each.key}.yaml"

  # Disk settings
  disks {
    scsi {
      scsi0 {
        disk {
          size    = each.value.disk_size
          storage = var.disk_storage
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = var.disk_storage
        }
      }
    }
  }

  scsihw = var.scsihw

  # Network settings
  network {
    model  = var.network_model
    bridge = var.network_bridge
  }

  kvm = var.kvm

  # Start VM after creation
  # oncreate = var.oncreate # depricated 
  vm_state = var.vm_state

  onboot = var.onboot

  protection = var.protection
}

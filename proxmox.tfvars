provider_type = "proxmox" # proxmox|vsphere

proxmox_api_url = "https://10.0.8.5:8006/api2/json"
# proxmox_user             = "root@pam" # When `proxmox_api_token_id` is unset
# proxmox_password         = "password" # When `proxmox_api_token_secret` is unset
proxmox_api_token_id     = "YourAPIkey"
proxmox_api_token_secret = "YourAPIsecret"
proxmox_node             = "ProxmoxNodeName"
pve_host                 = "10.0.8.5"
ssh_private_key          = "~/.ssh/id_rsa"

template_name  = "VMtemplateName"
agent          = 1
kvm            = true
disk_storage   = "data01"
network_model  = "virtio"
network_bridge = "vmbr0"
cpu            = "host"
onboot         = true
protection     = false
pve_user       = "your_ssh_username"

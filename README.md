# Terraform-Cloudinit

This is my Terraform config for setting up VMs and Kubernetes clusters with cloudinit.

## Structure

```text
.
├── modules
│   ├── cloud-init
│   │   ├── cloud-init-files
│   │   ├── cloud-init-template.yaml
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── proxmox
│   │   ├── main.tf
│   │   └── variables.tf
├── README.md
├── main.tf
├── proxmox-vars.tf
├── proxmox.tfvars
├── template-VMs.tfvars
├── variables.tf
├── vsphere-vars.tf
└── vsphere.tfvars
```

Copy and edit the `template-VMs.tfvars` to your likeing and adjust the following commands accordingly.

### init

```bash
terraform init
```

### plan

```bash
terraform plan -var-file="template-VMs.tfvars" -var-file="proxmox.tfvars"
```

### apply

```bash
terraform apply -var-file="template-VMs.tfvars" -var-file="proxmox.tfvars"
```

## Idea

- The "inventory" is the ./tfvars file.
- The ./main.tf file calls the `cloud-init` module whichdynamically creates the cloud-init files.
- The ./main.tf also calls the desired provider and creates the VMs within that provider.
- You can smply change the provider by passing `-var-file=PROVIDER.tfvars`

## Add Providers

- To add a provider, create a module named after the provider.
- Within this module, create a `main.tf` and a `variables.tf`.
- Configure the Provider accordingly. You can follow the example of proxmox.
- Add this module to the ./main.tf

## TODO

- [ ] ./modules/vsphere/main.tf
- [ ] Add more providers like AWS or Azure

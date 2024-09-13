# ./modules/cloud-init/main.tf

resource "local_file" "cloud_init_config" {
  for_each = var.vm_configurations
  content = templatefile("${path.module}/cloud-init-template.yaml", {
    hostname   = each.key,
    ip_address = each.value.ip_address,
    gateway    = var.gateway,
    dns1       = var.dns1,
    dns_search = var.dns_search
  })
  filename = "${path.module}/cloud-init-files/cloud-init-${each.key}.yaml"
}

# output "cloud_init_content" {
#   value = local_file.cloud_init_config.content
# }

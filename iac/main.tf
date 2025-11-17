provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure = true # Set to true for self-signed certificates, consider false for production with valid certs
}

resource "proxmox_vm_qemu" "openexchange_backend" {
  count       = 1
  name        = "openexchange-backend-${count.index}"
  target_node = var.proxmox_node
  clone       = var.vm_template_name
  full_clone  = true
  boot        = "order=scsi0" # Ensure booting from disk

  os_type = "cloud-init"
  ciuser = var.vm_ssh_user
  sshkeys = var.ssh_public_key

  cpu {
    cores = var.backend_vm_cpu_cores
  }
  memory  = var.backend_vm_memory_mb

  disk {
    slot    = "scsi0"
    size    = "${var.backend_vm_disk_size_gb}G"
    storage = var.proxmox_storage_pool
    type    = "disk"
  }

  disk {
    slot    = "scsi1"
    size    = "${var.backend_data_disk_size_gb}G"
    storage = var.proxmox_storage_pool
    type    = "disk"
  }

  network {
    id     = 0
    bridge = var.proxmox_bridge_network_id
    model  = "virtio"
    tag    = var.vlan_id_app_services
  }

  network {
    id     = 1
    bridge = var.proxmox_bridge_network_id
    model  = "virtio"
    tag    = var.vlan_id_database
  }

  ipconfig0 = "ip=${var.openexchange_backend_ip}/24,gw=${var.proxmox_gateway_ip}" # App & Services network
  ipconfig1 = "ip=dhcp" # Database network, or static if defined

  lifecycle {
    ignore_changes = [
      network,
      disk,
    ]
  }
}

resource "proxmox_vm_qemu" "openexchange_ui" {
  count       = 1
  name        = "openexchange-ui-${count.index}"
  target_node = var.proxmox_node
  clone       = var.vm_template_name
  full_clone  = true
  boot        = "order=scsi0"
  bootdisk    = "scsi0"

  os_type = "cloud-init"
  ciuser = var.vm_ssh_user
  sshkeys = var.ssh_public_key

  cpu {
    cores = var.ui_vm_cpu_cores
  }
  memory  = var.ui_vm_memory_mb

  disk {
    slot    = "scsi0"
    size    = "${var.ui_vm_disk_size_gb}G"
    storage = var.proxmox_storage_pool
    type    = "disk"
  }

  network {
    id     = 0
    bridge = var.proxmox_bridge_network_id
    model  = "virtio"
    tag    = var.vlan_id_frontend
  }

  ipconfig0 = "ip=${var.openexchange_ui_ip}/24,gw=${var.proxmox_gateway_ip}"

  lifecycle {
    ignore_changes = [
      network,
      disk,
    ]
  }
}

resource "proxmox_vm_qemu" "openexchange_services" {
  count       = 1
  name        = "openexchange-services-${count.index}"
  target_node = var.proxmox_node
  clone       = var.vm_template_name
  full_clone  = true
  boot        = "order=scsi0"

  os_type = "cloud-init"
  ciuser = var.vm_ssh_user
  sshkeys = var.ssh_public_key

  cpu {
    cores = var.services_vm_cpu_cores
  }
  memory  = var.services_vm_memory_mb

  disk {
    slot    = "scsi0"
    size    = "${var.services_vm_disk_size_gb}G"
    storage = var.proxmox_storage_pool
    type    = "disk"
  }

  network {
    id     = 0
    bridge = var.proxmox_bridge_network_id
    model  = "virtio"
    tag    = var.vlan_id_app_services
  }

  ipconfig0 = "ip=${var.openexchange_services_ip}/24,gw=${var.proxmox_gateway_ip}"

  lifecycle {
    ignore_changes = [
      network,
      disk,
    ]
  }
}

resource "proxmox_vm_qemu" "template_builder" {
  count       = 1
  name        = "template-builder-${count.index}"
  target_node = var.proxmox_node
  clone       = var.vm_template_name
  full_clone  = true
  boot        = "order=scsi0"

  os_type = "cloud-init"
  ciuser = var.vm_ssh_user
  sshkeys = var.ssh_public_key

  cpu {
    cores = var.template_builder_vm_cpu_cores
  }
  memory  = var.template_builder_vm_memory_mb

  disk {
    slot    = "scsi0"
    size    = "${var.template_builder_vm_disk_size_gb}G"
    storage = var.proxmox_storage_pool
    type    = "disk"
  }

  network {
    id     = 0
    bridge = var.proxmox_bridge_network_id
    model  = "virtio"
    tag    = var.vlan_id_management
  }

  ipconfig0 = "ip=dhcp" # Use DHCP for the temporary builder VM

  lifecycle {
    ignore_changes = [
      network,
      disk,
    ]
  }
}

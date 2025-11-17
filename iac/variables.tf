variable "proxmox_api_url" {
  description = "The URL of the Proxmox API."
  type        = string
  sensitive   = true
}

variable "proxmox_token_id" {
  description = "The Proxmox API token ID (e.g., root@pam!OXtoken)."
  type        = string
}

variable "proxmox_token_secret" {
  description = "The Proxmox API token secret."
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  description = "The Proxmox node name where VMs will be created."
  type        = string
}

variable "proxmox_storage_pool" {
  description = "The Proxmox storage pool name for VM disks."
  type        = string
}

variable "proxmox_bridge_network_id" {
  description = "The Proxmox bridge network ID to be used as a trunk port for VMs."
  type        = string
}

variable "vlan_id_management" {
  description = "VLAN ID for the Management network (VLAN 10)."
  type        = number
  default     = 10
}

variable "vlan_id_frontend" {
  description = "VLAN ID for the Frontend network (VLAN 20)."
  type        = number
  default     = 20
}

variable "vlan_id_app_services" {
  description = "VLAN ID for the App & Services network (VLAN 30)."
  type        = number
  default     = 30
}

variable "vlan_id_database" {
  description = "VLAN ID for the Database network (VLAN 40)."
  type        = number
  default     = 40
}

variable "vlan_id_monitoring_logging" {
  description = "VLAN ID for the Monitoring / Logging network (VLAN 50)."
  type        = number
  default     = 50
}

variable "openexchange_backend_ip" {
  description = "Static IP address for the OpenExchange Backend VM."
  type        = string
}

variable "openexchange_ui_ip" {
  description = "Static IP address for the OpenExchange UI VM."
  type        = string
}

variable "openexchange_services_ip" {
  description = "Static IP address for the OpenExchange Services VM."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key to be injected into the VMs for access."
  type        = string
  sensitive   = true
}

variable "vm_ssh_user" {
  description = "The user for SSH access to the VMs (e.g., ubuntu)."
  type        = string
  default     = "ubuntu"
}

variable "vm_template_name" {
  description = "The name of the cloud-init template to use for VMs."
  type        = string
}

variable "backend_vm_cpu_cores" {
  description = "Number of CPU cores for the OpenExchange Backend VM."
  type        = number
  default     = 8
}

variable "backend_vm_memory_mb" {
  description = "Amount of RAM in MB for the OpenExchange Backend VM."
  type        = number
  default     = 16384 # 16 GB
}

variable "backend_vm_disk_size_gb" {
  description = "Size of the primary disk in GB for the OpenExchange Backend VM."
  type        = number
  default     = 50 # OS disk
}

variable "backend_data_disk_size_gb" {
  description = "Size of the data disk in GB for the OpenExchange Backend VM."
  type        = number
  default     = 500
}

variable "ui_vm_cpu_cores" {
  description = "Number of CPU cores for the OpenExchange UI VM."
  type        = number
  default     = 4
}

variable "ui_vm_memory_mb" {
  description = "Amount of RAM in MB for the OpenExchange UI VM."
  type        = number
  default     = 8192 # 8 GB
}

variable "ui_vm_disk_size_gb" {
  description = "Size of the primary disk in GB for the OpenExchange UI VM."
  type        = number
  default     = 50
}

variable "services_vm_cpu_cores" {
  description = "Number of CPU cores for the OpenExchange Services VM."
  type        = number
  default     = 4
}

variable "services_vm_memory_mb" {
  description = "Amount of RAM in MB for the OpenExchange Services VM."
  type        = number
  default     = 8192 # 8 GB
}

variable "services_vm_disk_size_gb" {
  description = "Size of the primary disk in GB for the OpenExchange Services VM."
  type        = number
  default     = 50
}

variable "template_builder_vm_cpu_cores" {
  description = "Number of CPU cores for the Template Builder VM."
  type        = number
  default     = 2 # Default for temporary builder
}

variable "template_builder_vm_memory_mb" {
  description = "Amount of RAM in MB for the Template Builder VM."
  type        = number
  default     = 2048 # Default for temporary builder
}

variable "template_builder_vm_disk_size_gb" {
  description = "Size of the primary disk in GB for the Template Builder VM."
  type        = number
  default     = 30 # Default for temporary builder
}

variable "proxmox_gateway_ip" {
  description = "The gateway IP address for the Proxmox network bridge."
  type        = string
}

variable "custom_vm_template_name" {
  description = "The name of the custom OpenExchange VM template to create."
  type        = string
  default     = "openexchange-custom-template"
}

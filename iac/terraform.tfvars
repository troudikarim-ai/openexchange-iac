proxmox_api_url = "https://192.168.0.100:8006/api2/json"
proxmox_token_id = "root@pam!OXtoken"
proxmox_token_secret = "53db9d94-6d68-4358-b3ae-4829901062bb"
proxmox_node    = "gsserver"
proxmox_storage_pool = "local"
proxmox_bridge_network_id = "vmbr0"
vm_template_name = "ubuntu-2204-cloud-template"

# VLAN IDs
vlan_id_management = 10
vlan_id_frontend = 20
vlan_id_app_services = 30
vlan_id_database = 40
vlan_id_monitoring_logging = 50

# VM Sizing 
backend_vm_cpu_cores = 8
backend_vm_memory_mb = 16384
backend_vm_disk_size_gb = 50
backend_data_disk_size_gb = 500

ui_vm_cpu_cores = 4
ui_vm_memory_mb = 8192
ui_vm_disk_size_gb = 50

services_vm_cpu_cores = 4
services_vm_memory_mb = 8192
services_vm_disk_size_gb = 50

template_builder_vm_cpu_cores = 2
template_builder_vm_memory_mb = 2048
template_builder_vm_disk_size_gb = 30

# Static IP addresses for OpenExchange VMs (adjust as needed for your network)
openexchange_backend_ip = "192.168.30.10" # Example IP for App & Services VLAN 30
openexchange_ui_ip = "192.168.20.10"    # Example IP for Frontend VLAN 20
openexchange_services_ip = "192.168.30.11" # Example IP for App & Services VLAN 30
proxmox_gateway_ip = "192.168.10.1" # Example Gateway IP for Management VLAN 10 (adjust as needed)

# SSH Public Key for VM access
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDQMEQhVAdXQUqxHUOfqTRnCrCSgMSxEr5qR1zc0xEco+Oxpjhn2eDLZ8D3bYuBIifq2tSzlC9KdUSgSvLLfYxivYF3iC3s2r4uRU+RHrgRhwgztDh6iuxS25LeMO558bSSgLBS/VwYzMkiwY99fvUD+IeXaiKimTec2MW3QcIvzSsIYH2ux/V1ygyAbDPLKYO7TuIU9hg5EkHxqrT6nfmFdKZFuhmm1P+65D/OeKMlUxlHpXZuYYLLQNXBSOTT0ePHGmwsyFRREhZpNbaY+lmZqCQ19YM8PEdJJo9A/q5aoSsRRjj2W+MD0hJsxElzmPpA5vPb/TY/AHTh75D3BmbPotCHuz18TC15TrcP0SbCvZTJANjsiRaudET3wHtypXmNuA2BHG4j4ZpbBL8T3hv3WPnoe0KJfLcRCWLMsmA8zG5K5T36bylSEpnHtHUm+I8v0pNv8NRx4E+8aPZ8gF779Gh/0osLOaRgyIkquigXlcG5YiXpS4W1F8CJqVvpaBDGJsQbl3QxEAHTX2pXxoO7fLqXjbjnP497CfZ6MdpIvOD0e31Tp28sy2lkzRPiYwPH2UeyBzitrH367SBFf43QfEiL7gJLauxOr1BDWgHOlXHzQmm2bAFZCScznCxQ0NDnINj7Ce7FMIyyBikeJljshzcec7g5H4Z2iI9OuyP1xw== troudi.karim.2@esprit.tn"
vm_ssh_user = "ubuntu" # Default cloud-init user for Ubuntu

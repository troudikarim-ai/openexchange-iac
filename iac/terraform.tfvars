# Fichier de configuration Terraform pour le déploiement OpenExchange
# Remplissez ces variables avec vos valeurs spécifiques à l'environnement Proxmox et OpenExchange.

proxmox_api_url = "https://pve5c4p1.spv.ens-paris-saclay.fr:8006/api2/json"
proxmox_token_id = "terraform@pam!ef5ef1148646e908102db81481519"
proxmox_token_secret = "pq$bUejuHDD=F223"
proxmox_node = "pve5c4p1"
proxmox_storage_pool = "iscsi-vms"
proxmox_bridge_network_id = "vmbr0" # Le nom de votre bridge réseau Proxmox
proxmox_gateway_ip = "138.231.110.1" # L'IP de la passerelle pour votre réseau Proxmox (basée sur la plage fournie)

# VLAN IDs (valeurs par défaut si non spécifiées)
vlan_id_management = 10
vlan_id_frontend = 20
vlan_id_app_services = 30
vlan_id_database = 40
vlan_id_monitoring_logging = 50

# Adresses IP statiques pour les VMs OpenExchange (choisies dans la plage fournie)
openexchange_backend_ip = "138.231.110.111"
openexchange_ui_ip = "138.231.110.112"
openexchange_services_ip = "138.231.110.113"

# Clé publique SSH pour l'accès aux VMs
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4DBE6Ok+CFCQ2udmVuKlmeMsTM18rpAJarL6Oyfmhcm/3a7p8DDGa4LfnIYj7Ho3do52FCHvsSpUrhOuXWqp32+TpH8zqjixToKajJQTccs6ypgv1LKmkEs4tYAmfdeMvIAhUTj8mTr/AXPB/eBptrnlxEGRB5yQfd93oPCnx12o0O1c5qk0Zs/dS0ZXl5hK2sgb6Fe6cZl4dIfPdtLMpUkxhPhNRJzis21GtFCsravQzuwLZCSMUKu3cZ2mpCZ1EDyvDGW7QWfBKYI44CasOvxoT9MyOLedRpON8DoEJx9TWsUE/TNqata64YNnRC5TUh0xwIl+ROwfyWrOHMgcUSsjY2jAUcF6UdunuugJnoqQyA2yUQtWyTf9ZtC36RC0AvkMCIZeSoWZM0fPzCYYUhuws+dOQR1kpfASqzHjN4/47B7aaDZ7n+ANViCLT/ahOBEHi1ujD73mFnx57/yQTjFzzCoaNzgLX86YjU+JIcKvcUNQ54W48sg9QlBkXXbs= automat@next-terraform-ansible"

# Utilisateur SSH pour les VMs (configuré pour Debian)
vm_ssh_user = "debian" # Utilisateur par défaut pour les images Cloud-init Debian

# Nom du template Cloud-init Debian sur Proxmox
vm_template_name = "debian-13-cloudinit-template" # Assurez-vous que ce nom correspond à votre template Proxmox

# Ressources pour les VMs (valeurs par défaut si non spécifiées)
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

# Nom du template OpenExchange personnalisé à créer (si applicable)
custom_vm_template_name = "openexchange-custom-template"

resource "proxmox_vm_qemu" "main" {
  # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu

  # General
  target_node = var.target_node
  name        = var.name
  vmid        = var.vmid
  desc        = var.description
  onboot      = var.onboot
  oncreate    = var.oncreate
  pool        = var.pool

  # Clone
  clone        = var.clone
  full_clone   = var.full_clone
  force_create = var.force_create

  # OS
  tablet  = var.tablet
  boot    = var.boot
  agent   = var.agent
  qemu_os = var.qemu_os
  hotplug = var.hotplug
  scsihw  = var.scsihw
  vga {
    type   = var.vga_type
    memory = var.vga_memory
  }

  # CPU
  sockets = var.sockets
  cores   = var.cores
  vcpus   = var.vcpus
  cpu     = var.cpu

  # Memory
  memory  = var.memory
  balloon = var.balloon

  # Hard Disk  
  disk {
    type     = var.disk_type
    storage  = var.disk_storage
    size     = var.disk_size
    format   = var.disk_format
    cache    = var.disk_cache
    backup   = var.disk_backup
    iothread = var.disk_iothread
    ssd      = var.disk_ssd
    discard  = var.disk_discard
  }

  # Network
  network {
    model    = var.network_model
    bridge   = var.network_bridge
    tag      = var.network_tag
    firewall = var.network_firewall
  }

  # High Availability
  hastate = var.hastate
  hagroup = var.hagroup

  lifecycle {
    ignore_changes = [
      desc,
    ]
  }

  provisioner "local-exec" {
    working_dir = local.path_ansible_scripts

    command = "ansible-playbook site.yml --extra-vars 'host=${self.ssh_host} hostname=${self.name}'"
  }
}
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "instances" {
  name        = var.vm_name
  hostname    = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone
  # folder_id   = var.folder_id
  resources {
    cores         = var.cpu
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk
      type     = var.disk_type
    }
  }

  dynamic "secondary_disk" {
    for_each = var.secondary_disk
    content {
      disk_id     = lookup(secondary_disk.value, "disk_id")
      auto_delete = lookup(secondary_disk.value, "auto_delete", true)
      #auto_delete = var.disk_auto_delete
      #mode        = var.disk_mode
      mode = lookup(secondary_disk.value, "mode", "READ_WRITE")
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.nat
    ip_address         = var.internal_ip_address
    nat_ip_address     = var.nat_ip_address
  }

  metadata = {
    ssh-keys           = "${var.vm_user}:${file(var.ssh_public_key)}"
  }

  allow_stopping_for_update = var.allow_stopping_for_update
/*
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      host        = self.network_interface[0].nat_ip_address
      type        = "ssh"
      user        = local.user
      private_key = file(local.ssh_private_key)
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u '${local.user}' --private-key '${local.ssh_private_key}' --become -i '${self.network_interface[0].nat_ip_address},' provision.yml"
  }
*/
}
/*
resource "local_file" "inventory_file" {
  content = templatefile("./templates/inventory.tpl",
    {
      instances = yandex_compute_instance.instances
    }
  )
  filename = "./inventory.ini"
}
*/
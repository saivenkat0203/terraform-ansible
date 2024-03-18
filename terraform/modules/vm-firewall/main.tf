# # gcp-instance/main.tf

# resource "google_compute_firewall" "allow-http-ingress" {
#   name        = var.firewall_name
#   network     = var.network
#   priority    = 1000

#   allow {
#     protocol = "tcp"
#     ports    = var.firewall_ports
#   }

#   source_ranges = var.source_ranges

#   target_tags = google_compute_instance.default.tags
# }

# resource "google_compute_instance" "default" {
#   name         = var.instance_name
#   machine_type = var.machine_type
#   zone         = var.zone

#   tags = var.tags

#   boot_disk {
#     initialize_params {
#       image = var.image
#     }
#   }

#   network_interface {
#     network = var.network

#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   metadata = var.metadata

#   metadata_startup_script = var.startup_script
# }

# output "external_ip" {
#     # return the external IP address of the instance
#     value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
# }


# gcp-instance/main.tf

resource "google_compute_firewall" "allow-http-ingress" {
  name        = var.instance_config.firewall_name
  network     = var.instance_config.network
  priority    = 1000

  allow {
    protocol = "tcp"
    ports    = var.instance_config.firewall_ports
  }

  source_ranges = var.instance_config.source_ranges

  target_tags = google_compute_instance.default.tags
}

resource "google_compute_instance" "default" {
  name         = var.instance_config.instance_name
  machine_type = var.instance_config.machine_type
  zone         = var.instance_config.zone

  tags = var.instance_config.tags

  boot_disk {
    initialize_params {
      image = var.instance_config.image
    }
  }

  network_interface {
    network = var.instance_config.network

    access_config {
      # Ephemeral public IP
    }
  }

  labels = var.instance_config.labels

  metadata = var.instance_config.metadata

  metadata_startup_script = var.instance_config.startup_script
}

output "external_ip" {
  # return the external IP address of the instance
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

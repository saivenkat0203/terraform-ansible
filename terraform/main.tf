module "my_instance" {
  source = "./modules/vm-firewall"
  # instance_config = var.default-instance_config
  # instance_config = terraform.workspace == "dev" ? var.dev-instance_config : var.deploy-instance_config
  instance_config = var.deploy-instance_config
}

output "public_ip" {
  value     = module.my_instance.external_ip
  sensitive = true
}



# import {
#   to = google_compute_instance.manually-to-terraform-instance
#   id = "projects/proud-armor-410103/zones/us-central1-c/instances/manually-created"
# }

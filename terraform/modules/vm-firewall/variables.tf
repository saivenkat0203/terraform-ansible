# modules/vm-firewall/variables.tf

variable "instance_config" {
  description = "Configuration for the Google Compute Engine instance module"
  type = object({
    instance_name     = string
    machine_type      = string
    zone              = string
    tags              = list(string)
    labels            = map(string)
    image             = string
    network           = string
    metadata          = map(string)
    startup_script    = string
    credentials_path  = string
    project_id        = string
    region            = string
    firewall_name     = string
    firewall_ports    = list(number)
    source_ranges     = list(string)
  })
  default = {
    instance_name     = "terraform-instance"
    machine_type      = "e2-small"
    zone              = "asia-south1-c"
    tags              = ["tag1", "tag2"]
    labels            = { env = "dev", ubuntu = "20.04"}
    image             = "debian-cloud/debian-11"
    network           = "default"
    metadata          = { data = "metadata" }
    startup_script    = <<SCRIPT
#!/bin/bash
apt update 
apt -y install apache2
echo "startup script" > /var/www/html/index.html
SCRIPT
    credentials_path  = "/home/ishts/Desktop/Projects/terraform-gcp/secrets/secrets.json"
    project_id        = "proud-armor-410103"
    region            = "asia-south1"
    firewall_name     = "allow-http-ingress"
    firewall_ports    = [80, 443]
    source_ranges     = ["122.171.18.231"]
  }
}

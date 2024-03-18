project_id = "proud-armor-410103"
region = "asia-south1"
default-instance_config = {
  instance_name = "terraform-instance"
  machine_type = "e2-small"
  zone = "asia-south1-c"
  tags = ["tag1", "tag2"]
  image = "debian-cloud/debian-11"
  network = "default"
  metadata = { data = "metadata" }
  startup_script = <<SCRIPT
#!/bin/bash
apt update
apt -y install apache2
echo "startup script" > /var/www/html/index.html
SCRIPT
  credentials_path = "/home/ishts/Desktop/Projects/terraform-gcp/secrets/secrets.json"
  project_id = "proud-armor-410103"
  region = "asia-south1"
  firewall_name = "allow-http-ingress"
  firewall_ports = [80, 443]
  source_ranges = ["122.171.18.231"]
}
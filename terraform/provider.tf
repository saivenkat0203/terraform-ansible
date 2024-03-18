terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }

  backend "gcs" {
    bucket = "bucket-tf-ish"
    prefix = "terraform/state"

  }
}

provider "google" {
  credentials = file("secrets.json")
  project = var.project_id
  region  = var.region
}


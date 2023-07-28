terraform {
  required_version = ">=1.2.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.15.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.15.0"
    }

    sops = {
      source  = "carlpett/sops"
      version = "0.7.1"
    }
  }

  backend "gcs" {}
}

provider "google" {
  project = var.gcp.project
  region  = var.gcp.region
}

provider "google-beta" {
  project = var.gcp.project
  region  = var.gcp.region
}

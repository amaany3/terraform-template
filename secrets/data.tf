data "terraform_remote_state" "service" {
  backend = "gcs"

  config = {
    bucket = var.data_bucket
    prefix = "service"
  }
}

data "sops_file" "secrets" {
  source_file = "environments/${var.environment}/encrypted_secrets.yaml"
}

######################################################
# scan job secret
######################################################
resource "google_secret_manager_secret" "default" {
  secret_id = "${var.gcp.project}-default"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "default" {
  secret      = google_secret_manager_secret.default.id
  secret_data = data.sops_file.secrets.data["default"]
}

resource "google_compute_instance" "main-instance" {

  name         = var.main-instance-name
  machine_type = var.main-machine-type
  zone         = var.main-zone
  project      = var.project-name
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.main-instance-image
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    foo = "bar"
  }
  #metadata_startup_script = "gsutil cp gs://bucket1-20952/image-to-copy gs://bucket2-20952/"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

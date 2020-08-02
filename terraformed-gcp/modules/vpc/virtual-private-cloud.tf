resource "google_compute_network" "my-vpc" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnet1" {
  depends_on    = ["google_compute_network.my-vpc"]
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.my-vpc.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}
resource "google_compute_firewall" "my-firewall" {
  depends_on = ["google_compute_network.my-vpc"]
  name       = "test-firewall"
  network    = "vpc-network"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "1000-2000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

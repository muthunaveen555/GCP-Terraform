provider "google" {
  credentials = file("../../GCP-Assignment-be9389717b0e.json")
  project     = "mykubernetes-283719"
  region      = "us-central1"
}

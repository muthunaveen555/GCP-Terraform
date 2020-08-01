module "my-instance" {
  source             = "../modules/gce"
  main-instance-name = "nava-terraform-instance"
  project-name       = "mykubernetes-283719"
}

module "my-bucket" {
  source       = "../modules/gcs"
  project-name = "mykubernetes-283719"
  bucket-name  = "nava-bucket"
}

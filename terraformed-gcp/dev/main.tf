module "my-instance" {
  source             = "../modules/gce"
  main-instance-name = "nava-terraform-instance"
  project-name       = "mykubernetes-283719"
}

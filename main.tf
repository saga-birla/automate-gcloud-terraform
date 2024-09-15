provider "google" {
  project = "devops-8998"
}

resource "google_storage_bucket" "terraform-backend" {
  name = "terraform-backend-project"
  location = "asia-south2"
}

//******************** all the variables inside module *****************************//
variable "instance_name" {
  description = "name of the basic_instance resource"
  type = map(string)
  default = {
    "PROD" = "vm-prod"
    "SP" = "vm-sp"
    "UAT" = "vm-uat"
  }
}

variable "machine_type" {
  description = "machine_type of basic_instance"
}

variable "image_name" {
  description = "image_name of the basic_instance"
}

variable "network_type" {
  description = "network_type of the basic_instance"
}

module "basic_vm" {
  source = "./module/basic_vm"
  image_name = var.image_name
  instance_name = lookup(var.instance_name, terraform.workspace, "vm-demo")
  machine_type = var.machine_type
  network_type = var.network_type

}

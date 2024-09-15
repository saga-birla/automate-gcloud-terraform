provider "google" {
  project = "devops-8998"
}

variable "instance_name" {
  description = "name of the basic_instance resource"
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

resource "google_compute_instance" "basic_instance" {
  name = var.instance_name
  machine_type = var.machine_type
  zone = "asia-south2-b"
  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }
  network_interface {
    network = var.network_type
    access_config {
      
    }
  }
}

provider "google" {
    project = var.project_id
    region = var.region
}

// VM:

resource "google_compute_instance" "myvm" {
  name         = var.vmname
  machine_type = var.machine_type
  zone         = var.zone

  

  boot_disk {
    initialize_params {
      image = var.vmimage
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.mysubnet.name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  
}

//VPC

resource "google_compute_network" "vpc_network" {
 
  name                    =  var.vpcname
  auto_create_subnetworks = false
  
}


//SUBNETWORK: 

resource "google_compute_subnetwork" "mysubnet" {
  name          = var.subnetname
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
  
}


//FIREWALL:

resource "google_compute_firewall" "myfirewall" {
  name    = var.firewallname
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}


//Project_id
variable "project_id" {
    default = "qwiklabs-gcp-01-b410f72155cb"
}

//Region:

variable "region" {
    default = "us-central1"
}

//zone:

variable "zone" {
    default = "us-central1-a"
}

//vm name:

variable "vmname" {
    default = "vaishuvm"
}

//machine_type:

variable "machine_type" {
    default = "n2-standard-2"
}


//vmimage:

variable "vmimage" {
     default = "debian-cloud/debian-11"
}

//VPC NAME:

variable "vpcname" {
     default = "vaishuvpc"
}

// SUBNET:

variable "subnetname" {
  default = "vaishusubnet"
}

//ip_cidr_range:

variable "ip_cidr_range" {

}

// firewall:

variable "firewallname" {
    default = "vaishufirewall"
}


// Enable the project as a Shared VPC host project
resource "google_compute_shared_vpc_host_project" "host_project" {
  project = module.project-factory.project_id
}

// Configure the Shared VPC module to create a network and subnet
module "shared-vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.0"

  project_id   = module.project-factory.project_id
  network_name = var.vpc_name

  subnets = [
    {
      subnet_name           = "sb-nonprod-gke1-pod"
      subnet_ip             = "10.167.128.0/19"
      subnet_region         = var.region
      subnet_private_access = false
    },
    {
      subnet_name           = "sb-nonprod-gke1-service"
      subnet_ip             = "10.167.160.0/20"
      subnet_region         = var.region
      subnet_private_access = false
    },
    {
      subnet_name           = "sb-nonprod-gke1-node"
      subnet_ip             = "10.167.176.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-gke1-control"
      subnet_ip             = "10.167.177.0/28"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-shared-frontend"
      subnet_ip             = "10.167.178.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-shared-backend"
      subnet_ip             = "10.167.179.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-shared-db"
      subnet_ip             = "10.167.180.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-shared-compute"
      subnet_ip             = "10.167.181.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-shared-ilb"
      subnet_ip             = "10.167.182.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    },
    {
      subnet_name           = "sb-nonprod-proxy-only-subnet"
      subnet_ip             = "10.167.183.0/24"
      subnet_region         = var.region
      subnet_private_access = true
    }
  ]
}

//enable after already created peer project then update var.peer_project_id
# data "google_compute_network" "vpc_net_hub" {
#   name    = var.peer_network
#   project = var.peer_project_id
# }

# resource "google_compute_network_peering" "nonprod_hub_peering" {
#   name         = var.peer_name
#   network      = module.shared-vpc.network_self_link
#   peer_network = data.google_compute_network.vpc_net_hub.self_link
# }
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = module.project-factory.project_id
  
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "sb-hub-compute"
  ip_cidr_range = "10.167.184.0/24"
  region         = var.region
  network       = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

//enable after already created peer project then update var.peer_project_id
# data "google_compute_network" "vpc_net_share_nonprod" {
#   name    = var.peer_network
#   project = var.peer_project_id
# }

# resource "google_compute_network_peering" "hub_nonprod_peering" {
#   name         = var.peer_name
#   network      = google_compute_network.vpc_network.self_link
#   peer_network = data.google_compute_network.vpc_net_share_nonprod.self_link
# }
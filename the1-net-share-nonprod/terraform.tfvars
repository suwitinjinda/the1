// Provide values for the variables
region                   = "asia-southeast1"
# project_id               = "the1-net-shared-nonprod-abcde"
project_name             = "the1-net-shared-nonprod"
org_id                   = "699367575016"
billing_account_id       = "01A724-1C309F-FFB055"
folder_id                = "106597095818"  // Optional
lien                     = false //use for develope
activate_apis            = ["compute.googleapis.com", "storage.googleapis.com"]

#VPC name
vpc_name                 = "vpc-net-share-nonprod"
#VPC peering
peer_network             = "vpc-net-hub" //peer VPC hub network
peer_project_id          = "the1-net-hub-893c" //peer hub project ID
peer_name                = "nonprod-hub-peering" //peer name
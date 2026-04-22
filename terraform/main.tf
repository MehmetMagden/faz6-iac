terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.67.0"
        }
        local = {
            source = "hashicorp/local"
            version = "~> 2.0"
        }
    }
}


# -- Module Call 1 : Network --
module "network" {
    source = "./modules/network"

    # variables.tf values
    vpc_cidr    = "10.0.0.0/16"
    subnet_cidr = "10.0.1.0/24"
    environment = "dev"
}

# -- Module Call 2 : Compute --
module "compute" {
    source = "./modules/compute"
    # Receive values from Network outputs
    vpc_id      = module.network.vpc_id
    subnet_id = module.network.subnet_id

    instance_type = "t2.micro"
    environment = "dev"

}

# resource "local_file" "mission_briefing" {
#     filename = "./mission.txt"
#     content = "FAZ 6 basladi. Tony Stark onayladi"
# }
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

resource "local_file" "mission_briefing" {
    filename = "./mission.txt"
    content = "FAZ 6 basladi. Tony Stark onayladi"
}
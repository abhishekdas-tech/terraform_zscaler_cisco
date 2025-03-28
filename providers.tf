terraform {
  backend "s3" {
    bucket = "terraform-state-n2"
    key = "cisco/C8000V"
    region = "us-east-1"
  }

  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "0.5.7"
    }
  }
}

provider "iosxe" {
  username = var.username
  password = var.password
  url      = "https://devnetsandboxiosxe.cisco.com"
}
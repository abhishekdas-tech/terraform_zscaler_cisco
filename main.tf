locals {
  zscaler_data = jsondecode((file("${path.module}/zscaler_ip_range.json")))
}

locals {
  ip_ranges = flatten([
    for continent in local.zscaler_data["zscaler.net"] : [
      for city in continent : [
        for entry in city :
        entry["range"] if !can(regex(":", entry["range"])) # Exclude IPv6
      ]
    ]
  ])
}

locals {
  prefixes = [
    for index, entry in local.ip_ranges : {
      name   = "Zscaler_IP_Range"
      seq    = index + 1
      action = "permit"
      ip     = entry

    }
  ]
}

resource "iosxe_prefix_list" "zscaler_ip_range" {
  prefixes = local.prefixes
    prefix_list_description = [
      {
        name        = "Zscaler_IP_Range"
        description = "All the Zscaler DataCenter IP Addresses version 2"
      }
    ]
}
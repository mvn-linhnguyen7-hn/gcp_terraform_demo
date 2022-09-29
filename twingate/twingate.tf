resource "twingate_remote_network" "gcp_network" {
  name  = "twingate_terraform"
}

resource "twingate_connector" "gcp_connector" {
  name = "twingate-connector-1"
  remote_network_id = twingate_remote_network.gcp_network.id
}

resource "twingate_connector_tokens" "gcp_connector_tokens" {
  connector_id = twingate_connector.gcp_connector.id
}

resource "twingate_resource" "service_site" {
  name              = "test"
  address           = "test.bomky.shop"
  remote_network_id = twingate_remote_network.gcp_network.id
  group_ids         = ["R3JvdXA6NjIwMzY="]
  protocols {
    allow_icmp = false
    tcp {
      policy = "RESTRICTED"
      ports  = ["80", "443"]
    }
    udp {
      policy = "RESTRICTED"
      ports  = ["80", "443"]
    }
  }
}

resource "twingate_resource" "cloud_run" {
  name              = "Cloud_run"
  address           = replace(google_cloud_run_service.default.status[0].url, "https://", "*")
  remote_network_id = twingate_remote_network.gcp_network.id
  group_ids         = ["R3JvdXA6NjIwMzY="]
  protocols {
    allow_icmp = false
    tcp {
      policy = "RESTRICTED"
      ports  = ["80", "443"]
    }
    udp {
      policy = "RESTRICTED"
      ports  = ["80", "443"]
    }
  }
}

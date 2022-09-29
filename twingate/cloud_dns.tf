data "google_dns_managed_zone" "main" {
  name = "test-zone-name"
}

resource "google_dns_record_set" "cloud_run_resource_recordset_CNAME" {
  managed_zone = data.google_dns_managed_zone.main.name
  name         = "test.bomky.shop."
  type         = "CNAME"
  rrdatas      = ["ghs.googlehosted.com."]
  ttl          = 86400
}

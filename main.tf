provider "cloudflare" {
  email = var.cloudflare_email
  token = var.cloudflare_token
}

resource "cloudflare_record" "dns_record" {
  count = length(var.cloudflare_records)

  domain = var.cloudflare_zone
  name = var.cloudflare_records[count.index].name
  value = var.external_ip
  type = "A"
  proxied = var.cloudflare_records[count.index].proxied
}

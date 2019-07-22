variable "cloudflare_email" {
  type = string
  description = "Your cloudflare email"
}

variable "cloudflare_token" {
  type = string
  description = "Your cloudflare API token"
}

variable "cloudflare_zone" {
  type = string
  description = "Your cloudflare DNS zone"
}

variable "cloudflare_records" {
  type = list(object({
    name = string,
    proxied = bool,
  }))
  description = "List of your cloudflare DNS records"
}

variable "external_ip" {
  type = string
  description = "Your external IP address"
}
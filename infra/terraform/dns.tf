resource "cloudflare_dns_record" "dns_record" {
  zone_id = var.cloudflare_zone_id
  name    = "chukwukelu.online"
  ttl     = 1
  type    = "A"
  comment = "Update record"
  content = aws_instance.this.public_ip
  proxied = false
}
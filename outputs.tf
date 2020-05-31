# Record some meta about droplet created
output "freebsd_ipv4" {
  value = digitalocean_droplet.freebsd.ipv4_address
}

output "freebsd_droplet_name" {
  value = digitalocean_droplet.freebsd.name
}

output "freebsd_droplet_id" {
  value = digitalocean_droplet.freebsd.id
}

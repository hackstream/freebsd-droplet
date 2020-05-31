provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

# Create a new SSH key
resource "digitalocean_ssh_key" "mrkaran" {
  name       = "mrkaran.dev"
  public_key = file("~/.ssh/mrkaran_rsa.pub")
}

# Create a new SSH key
resource "digitalocean_ssh_key" "sarat" {
  name       = "sarat.dev"
  public_key = file("./sarat.pub")
}

# Create a new droplet in the blr1 region (master node)
resource "digitalocean_droplet" "freebsd" {
  image  = "freebsd-12-x64-zfs"
  name   = "freebsd"
  region = "blr1"
  monitoring = false
  size   = "s-1vcpu-1gb"
  ipv6               = true
  private_networking = true
  tags = [
    "freebsd",
    "hackstream",
    "dnscrypt",
  ]
  ssh_keys = [digitalocean_ssh_key.mrkaran.fingerprint, digitalocean_ssh_key.sarat.fingerprint]
}

# Attach the floating ip to droplet
resource "digitalocean_floating_ip" "freebsd" {
  droplet_id = digitalocean_droplet.freebsd.id
  region     = digitalocean_droplet.freebsd.region
}

resource "digitalocean_project" "hackstream" {
  name        = "hackstream"
  description = "All projects under HackStream"
  purpose     = "Web Application"
  environment = "Development"
  resources   = [digitalocean_droplet.freebsd.urn, digitalocean_floating_ip.freebsd.urn]
}

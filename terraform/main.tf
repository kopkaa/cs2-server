terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

# SSH klíč pro přístup na server
resource "hcloud_ssh_key" "default" {
  name       = "cs-server-key"
  public_key = file(var.ssh_public_key_path)
}

# Firewall pro CS server
resource "hcloud_firewall" "cs_server" {
  name = "cs-server-firewall"

  # SSH
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # CS 1.6 Game Server (27015)
  rule {
    direction = "in"
    protocol  = "udp"
    port      = "27015"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # RCON (remote console) - optional, můžeš zakomentovat
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "27015"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # HLTV (spectator) - optional
  rule {
    direction = "in"
    protocol  = "udp"
    port      = "27020"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

# Vytvoření VPS serveru
resource "hcloud_server" "cs_server" {
  name        = var.server_name
  server_type = var.server_type
  image       = "ubuntu-22.04"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  
  firewall_ids = [hcloud_firewall.cs_server.id]

  labels = {
    type = "gameserver"
    game = "counter-strike"
  }

  # Základní setup po vytvoření
  user_data = <<-EOF
    #cloud-config
    package_update: true
    package_upgrade: true
    packages:
      - curl
      - wget
      - git
      - htop
      - screen
    runcmd:
      - echo "Server ready for Ansible provisioning"
  EOF
}

# Čekání až bude server ready
resource "null_resource" "wait_for_server" {
  depends_on = [hcloud_server.cs_server]

  provisioner "local-exec" {
    command = "sleep 30"
  }
}

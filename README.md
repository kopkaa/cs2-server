# 🎮 CS2 Server on Hetzner - Terraform & Ansible

Complete automated setup of **Counter-Strike 2** server on Hetzner Cloud for casual gaming with friends.

## 🚀 Quick Start

```bash
cd terraform/
cp terraform.tfvars.example terraform.tfvars

# 2. Create infrastructure
terraform init
terraform apply

# 3. Deploy CS2 server
cd ../ansible/
nano inventory.yml  # set IP address
ansible-playbook -i inventory.yml playbook.yml

```

## 📋 Requirements

- [x] Hetzner Cloud account + API token
- [x] Terraform installed
- [x] Ansible installed
- [x] SSH key (~/.ssh/)

## 🎯 What You Get

✅ **Automatically configured VPS** (Ubuntu 22.04)
✅ **Counter-Strike 2 dedicated server**
✅ **Metamod:Source** + **CounterStrikeSharp** (plugin framework)
✅ **AIM maps** (Dust2, Mirage, custom aim maps)
✅ **Admin plugins** (kick, ban, map change)
✅ **Systemd service** (auto-restart on crash)
✅ **Firewall** (SSH + CS2 ports)

## 🗺️ Pre-installed Maps

### Map rotation:
- **de_dust2** - Classic
- **de_mirage** - Popular competitive
- **aim_map** - Custom AIM training

Maps automatically rotate after each match.


## 🛠️ Useful Commands

```bash

# Ansible
ansible-playbook -i inventory.yml playbook.yml  # Deploy

# Server management
ssh root@YOUR-IP
sudo systemctl status cs2-server
sudo systemctl restart cs2-server
sudo journalctl -u cs2-server -f  # Logs
```

## 🎮 Server Control

### Connect via RCON (from CS2 console):
```
rcon_password zmensito123
rcon status
rcon changelevel de_mirage
rcon say "Hello everyone!"
```

### Change map (SSH):
```bash
ssh root@YOUR-IP
# Use RCON commands from server console
```

## 🔌 Plugins for CS2

Server comes with pre-installed:
- **CounterStrikeSharp** - Plugin framework for CS2
- **Metamod:Source** - Base for plugins

### How to add plugins:
1. Find plugin for CounterStrikeSharp
2. Download `.dll` file
3. Upload to `/home/steam/cs2/game/csgo/addons/counterstrikesharp/plugins/`
4. Restart server

**Recommended plugins:**
- **CSS Admin** - Admin commands
- **Map Chooser** - Map voting
- **Deathmatch** - Respawn mode

## 📚 Resources

- **CS2 Dedicated Server Docs**: https://developer.valvesoftware.com/wiki/Counter-Strike_2/Dedicated_Servers
- **CounterStrikeSharp**: https://docs.cssharp.dev/
- **CS2 Maps**: https://steamworkshop.download/app/730


## 📝 License

Free to use, modify and distribute. Have fun! 🎮

---

Made with ❤️ for the CS2 community

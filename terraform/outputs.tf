output "server_ip" {
  description = "IP adresa tvého CS serveru"
  value       = hcloud_server.cs_server.ipv4_address
}

output "server_name" {
  description = "Název serveru"
  value       = hcloud_server.cs_server.name
}

output "connect_command" {
  description = "Příkaz pro připojení přes SSH"
  value       = "ssh root@${hcloud_server.cs_server.ipv4_address}"
}

output "cs_connect_info" {
  description = "Info jak se připojit do hry"
  value       = "V CS konzoli: connect ${hcloud_server.cs_server.ipv4_address}:27015"
}

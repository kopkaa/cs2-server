variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  description = "SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "server_name" {
  description = "Server name"
  type        = string
  default     = "cs-kopka-server"
}

variable "server_type" {
  description = "Hetzner server type (CX11, CPX11, CX21, etc.)"
  type        = string
  default     = "cx21"  # 2 vCPU, 4GB RAM
}

variable "location" {
  description = "Location (nbg1=Norimberk, fsn1=Falkenstein, hel1=Helsinki)"
  type        = string
  default     = "nbg1" 
}

resource "digitalocean_droplet" "web1" {
  image = "ubuntu-18-04-x64"
  name = "web1"
  region = "sfo2"
  size = "s-1vcpu-1gb"
  private_networking = "true"
  user_data = file("config/webdata.sh")
  ssh_keys = [
    var.ssh_fingerprint
  ]
  connection {
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

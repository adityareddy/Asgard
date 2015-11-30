/* Mesos slave instances */
resource "digitalocean_droplet" "mesos-slave" {
  image              = "ubuntu-14-04-x64"
  region             = "${var.region}"
  count              = "${var.slaves}"
  name               = "asgard-mesos-slave-${count.index}"
  size               = "${var.instance_type.slave}"
  depends_on         = ["digitalocean_droplet.mesos-master"]
  private_networking = true
  user_data          = "{role: mesos_slaves}"
  ssh_keys = [
    "${digitalocean_ssh_key.default.id}"
  ]
    # install mesos, haproxy, docker, openvpn, and configure the node
    provisioner "remote-exec" {
      scripts = [
        "${path.module}/../../scripts/base.sh",
        "${path.module}/../../scripts/install_consul.sh"
      ]
    }
}
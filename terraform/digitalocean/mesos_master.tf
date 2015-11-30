/* Mesos master instances */
resource "digitalocean_droplet" "mesos-master" {
  image              = "ubuntu-14-04-x64"
  region             = "${var.region}"
  count              = "${var.masters}"
  name               = "asgard-mesos-master-${count.index}"
  size               = "${var.instance_type.master}"
  depends_on         = ["digitalocean_ssh_key.default"]
  private_networking = true
  user_data          = "{role: mesos_masters}"
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
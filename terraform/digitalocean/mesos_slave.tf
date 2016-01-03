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
        "${path.module}/../../scripts/install_mesos_slave.sh"
      ]
    }
    provisioner "remote-exec" {
        inline = [
          "cd ~/Asgard",
          "./scripts/generate_slave_inventory.sh {join(",", digitalocean_droplet.mesos-master.*.private_ip} scripts/slave_inventory",
          "ansible-playbook -i scripts/slave_inventory deploy.yml --extra-vars 'ansible_ssh_host=127.0.0.1 ansible_ssh_port=22' --tags 'mesos-slave'"
        ]
    }
}
/* Create a new SSH key */
resource "digitalocean_ssh_key" "default" {
    name = "Asgard"
    public_key = "${file(var.key_file)}"
}
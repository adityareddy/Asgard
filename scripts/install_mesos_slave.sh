sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
cd ~/
git clone https://github.com/adityareddy/Asgard
cd Asgard
chmod +x scripts/generate_slave_inventory.sh
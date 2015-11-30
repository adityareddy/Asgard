export PATH=$PATH:/usr/bin

# Update apt and get dependencies
sudo apt-get update
sudo apt-get install -y unzip curl wget python-pip
sudo pip install docker-py==1.5.0

# Install Docker
sudo curl -sSL https://get.docker.com/ | sh

# Install Java 8 from Oracle's PPA
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update -y
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | \
sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

# Setup
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update
sudo apt-get -y install mesos marathon
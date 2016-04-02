# Install Docker on Ubuntu 14.04.4 LTS
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean
uname -r
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get upgrade
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install apparmor
sudo apt-get install docker-engine
sudo service docker start
sudo docker run hello-world
sudo usermod -aG docker ubuntu
exit
docker run hello-world

# Optional 
sudo ufw status
sudo vim /etc/default/grub
sudo update-grub
sudo reboot
sudo apt-get upgrade docker-engine

# Generate SSH Key
# cd .ssh
# ssh-keygen -t rsa
# cat id_rsa.pub 
# cd ~
# git clone git@github.com:sdsunjay/hitch_a_ride.git

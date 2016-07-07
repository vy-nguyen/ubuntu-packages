#!/bin/bash

sudo apt-get install -y openssh-client openssh-server
sudo apt-get install -y git tree
sudo apt-get install -y mysql-server make

# password tienV13tNam@do

mysql --user=root -p
# create user 'socnet'@'localhost' identified by 'socnetsocnet';
# GRANT ALL PRIVILEGES ON *.* TO 'socnet'@'localhost'; 
# FLUSH PRIVILEGES;

cd
mkdir -p ws
cd ws
git clone https://github.com/vy-nguyen/tvntd.git tvntd

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

sudo apt-get remove --purge node
sudo ln -s /usr/lib/jvm/java-8-oracle/ /usr/lib/jvm/default-java 

# Download gradle
# unzip, install to /usr/lib
#
# export GRADLE_HOME=/usr/lib/gradle-xxx
# setup softlink to /usr/bin/gradle

# Install nvm
#
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile
nvm install 5.12.0
npm install
npm install -g bower
npm install -g webpack

n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

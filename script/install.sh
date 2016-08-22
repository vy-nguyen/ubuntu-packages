#!/bin/bash

work_dir=`pwd`
cp -rf vynguyen/bin ~

sudo cp -rf etc /etc
if [ "$?" -ne "0" ]; then
    echo "You need to have root permission"
    exit 1
fi

sudo apt-get install -y openssh-client openssh-server git tree make unzip tmux
sudo apt-get install cscope ctags

# Install Java
#
echo "Installing Java..."
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo ln -s /usr/lib/jvm/java-8-oracle/ /usr/lib/jvm/default-java 

# Install node
#
echo "Installing node..."
sudo rm -rf /usr/local/lib/node_modules/
rm -rf ~/.nvm/

sudo apt-get remove --purge node
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile

sudo apt-get -y install build-essential libssl-dev
nvm install 5.12.0
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
sudo `which npm` install -g bower webpack

# Install gradle
#
echo "Installing Gradle..."
wget https://downloads.gradle.org/distributions/gradle-2.14-bin.zip
unzip gradle-2.14-bin.zip
sudo mv gradle-2.14 /usr/lib
export GRADLE_HOME=/usr/lib/gradle-2.14
sudo rm /usr/bin/gradle
sudo ln -s /usr/lib/gradle-2.14/bin/gradle /usr/bin/gradle

# Install mysql
#
sudo apt-get install -y mysql-server

# password tienV13tNam@do

mysql --user=root -p < socnet.sql
# create user 'socnet'@'localhost' identified by 'socnetsocnet';
# GRANT ALL PRIVILEGES ON *.* TO 'socnet'@'localhost'; 
# FLUSH PRIVILEGES;

# Create ws clone
#
cd
mkdir -p ws
cd ws

git clone https://github.com/vy-nguyen/tvntd.git tvntd
cd tvntd
git submodule init
git submodule update --recursive
scripts/dev-start.sh

cd java/socnet
npm install
bower install

gradle build
gradle test

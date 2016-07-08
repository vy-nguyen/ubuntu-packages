#!/bin/bash

work_dir=`pwd`
cp -rf etc /etc
if [ "$?" -ne "0" ]; then
    echo "You need to have root permission"
    exit 1
fi

sudo apt-get install -y openssh-client openssh-server git tree make

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
sudo apt-get remove --purge node
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile
nvm install 5.12.0
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
npm install -g bower
npm install -g webpack

# Install gradle
#
echo "Installing Gradle..."
wget https://downloads.gradle.org/distributions/gradle-2.14-bin.zip
unzip gradle-2.14-bin.zip
mv gradle-2.14 /usr/lib
export GRADLE_HOME=/usr/lib/gradle-2.14
rm /usr/bin/gradle
ln -s /usr/lib/gradle-2.14/bin/gradle /usr/bin/gradle

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

cd tvntd/java/socnet
npm install
bower install

# Download gradle
# unzip, install to /usr/lib
#
# export GRADLE_HOME=/usr/lib/gradle-xxx
# setup softlink to /usr/bin/gradle

# Install nvm
#
#curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
#source ~/.profile
#nvm install 5.12.0
#npm install
#npm install -g bower
#npm install -g webpack


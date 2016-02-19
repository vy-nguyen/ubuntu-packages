PATH=$PATH:/home/vynguyen/bin
ulimit -c unlimited

export EDITOR=vim
export AWS_ACCESS_KEY=vy-aws
export AWS_SECRET_KEY=$HOME/.ssh/vy-aws.pem
export EC2_URL=https://ec2.us-west-1.amazonaws.com
export JAVA_HOME=/usr/lib/jvm/default-java

export NVM_DIR="/home/vynguyen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

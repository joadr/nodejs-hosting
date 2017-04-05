#!/bin/sh
set -e

sh /home/deploy/script/createSwapMemory.sh

# Install things
echo "====> Updating apt registry..."
sudo apt-get update > /dev/null

echo "====> Installing nodejs and yarn..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - > /dev/null
sudo apt-get install nodejs -y > /dev/null
sudo npm install yarn -g > /dev/null

echo "====> Install phantomjs deps..."
sudo apt-get install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev -y > /dev/null

# Go to app folder
cd app
cd $APP_LOCATION # Add an if here

echo "====> App dependencies..."
sudo yarn install

echo "====> Building app..."
sudo yarn build

echo "====> Preparing server..."
cd /home/deploy/script/server
sudo yarn install
sudo yarn global add babel-cli

echo "====> Starting server..."
nohup sh /home/deploy/script/run.sh > /dev/null 2>&1 &

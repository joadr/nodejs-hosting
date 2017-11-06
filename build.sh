#!/bin/sh
set -e

# Install things
echo "====> Updating apt registry..."
sudo apt-get update > /dev/null

echo "====> Installing nodejs and yarn..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - > /dev/null
sudo apt-get install nodejs -y > /dev/null
sudo npm install yarn -g > /dev/null

# Go to app folder
cd app
cd $APP_LOCATION # Add an if here
echo "MONGO URL: $MONGO_URL"

echo "====> App dependencies..."
sudo yarn install

echo "====> Building app..."
sudo yarn build

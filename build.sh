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
echo "/home/deploy/code/app/$APP_LOCATION/lib/"

echo "====> App dependencies..."
sudo yarn install

echo "====> Building app..."
sudo yarn build

export $(cat /home/deploy/.env | xargs)

echo $(ls /home/deploy/app/service)
echo $(ls /home/deploy/app/service/lib)

node /home/deploy/app/service/lib/index.js | sudo tee /home/deploy/app.log

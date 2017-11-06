export $(cat /home/deploy/.env | xargs)

echo "Running application..."
cd /home/deploy/code/app
cd $APP_LOCATION
echo "AT: /home/deploy/code/app/$APP_LOCATION"
node lib/index.js | sudo tee /home/deploy/app.log

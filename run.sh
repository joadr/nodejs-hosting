export $(cat /home/deploy/.env | xargs)

echo "Running application..."
node /home/deploy/code/app/$APP_LOCATION/lib/index.js | sudo tee /home/deploy/app.log

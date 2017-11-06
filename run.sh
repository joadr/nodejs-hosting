export $(cat /home/deploy/.env | xargs)

echo "Running application..."
echo "$MONGO_URL" > /home/deploy/app.log
node /home/deploy/code/app/$APP_LOCATION/lib/index.js | sudo tee /home/deploy/app.log

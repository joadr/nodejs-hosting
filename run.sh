export $(cat /home/deploy/.env | xargs)

node /home/deploy/app/service/lib/index.js | sudo tee /home/deploy/app.log

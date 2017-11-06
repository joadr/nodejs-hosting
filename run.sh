export $(cat /home/deploy/.env | xargs)

node /home/deploy/script/service/lib/index.js | sudo tee /home/deploy/app.log

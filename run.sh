export $(cat /home/deploy/.env | xargs)

babel-node /home/deploy/script/server/src/index.js | sudo tee /home/deploy/app.log

source /home/deploy/.env

sudo babel-node /home/deploy/script/server/src/index.js | sudo tee /home/deploy/app.log

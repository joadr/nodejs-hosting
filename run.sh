export $(cat /home/deploy/.env | xargs)

echo $(ls /home/deploy/)

echo $(ls /home/deploy/app)

echo $(ls /home/deploy/app/service)

node /home/deploy/script/service/lib/index.js | sudo tee /home/deploy/app.log

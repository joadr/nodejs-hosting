export $(cat /home/deploy/.env | xargs)

echo $(ls)

echo $(ls /home/deploy/)

echo $(ls /home/deploy/script)

echo $(ls /home/deploy/code/app)

node /home/deploy/script/service/lib/index.js | sudo tee /home/deploy/app.log

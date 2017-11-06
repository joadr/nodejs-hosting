export $(cat /home/deploy/.env | xargs)

echo $(ls /home/deploy/app/service)
echo $(ls /home/deploy/app/service/lib)

node /home/deploy/app/service/lib/index.js | sudo tee /home/deploy/app.log

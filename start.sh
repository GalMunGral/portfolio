sudo service mysql start
mongod &
(cd /code/notube && ./run.sh)
(cd /code/respotify && ./run.sh)
(cd /code/web-repl && ./run.sh)
cd /entry && node index.js

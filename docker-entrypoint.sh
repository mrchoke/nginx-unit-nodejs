#!/bin/bash
set -m

unitd --no-daemon --control '*:8000'  --pid /var/run/unitd.pid &
if [ ! -f /started ];  then

cd /srv/app

npm install
npm link unit-http

curl -X PUT -d @/srv/app/unit.json  http://localhost:8000/config/
curl -X PUT -d '"/dev/stdout"' http://localhost:8000/config/access_log

touch /started

fi

fg

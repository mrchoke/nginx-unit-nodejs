#!/bin/bash
set -m

unitd --no-daemon --control unix:/var/run/control.unit.sock &

if [ ! -f /started ];  then

cd /srv/app

npm install
npm link unit-http

curl -X PUT -d @/srv/app/unit.json   --unix-socket /var/run/control.unit.sock  http://localhost/config/

touch /started

fi

fg

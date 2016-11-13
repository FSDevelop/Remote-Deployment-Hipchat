#!/bin/bash
cd ..
cd ewcalc-dev

hipchatHost=[Hipchat Notification URL]

# Kill current passenger process (or whatever is running)
curl -d '{"color":"green","message":"Stopping current app running in port 80...","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost
passengerPID=`ps aux | grep passenger | head -n 1 | awk '{ print $2; }'`
kill $passengerPID

# Get latest changes from git
curl -d '{"color":"green","message":"Getting latest changes from github...","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost
git fetch origin develop
git merge origin/develop

# Update resources with grunt
curl -d '{"color":"green","message":"Running Grunt tasks...","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost
grunt build

# Start app
curl -d '{"color":"green","message":"Starting app in port 80...","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost
curl -d '{"color":"green","message":"Done.","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost
passenger start --port 80


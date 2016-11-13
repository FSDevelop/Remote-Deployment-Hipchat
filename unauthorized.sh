#!/bin/bash
hipchatHost=[Hipchat notification URL]
curl -d '{"color":"red","message":"Unauthorized to do deployment.","notify":false,"message_format":"text"}' -H 'Content-Type: application/json' $hipchatHost


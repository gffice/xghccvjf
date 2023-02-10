#!/bin/bash


if [[ -z "$NGROK_TOKEN" ]]; then
  echo "Please set 'NGROK_TOKEN'"
  exit 2
fi

#if [[ -z "$USER_PASS" ]]; then
#  echo "Please set 'USER_PASS' for user: $USER"
#  exit 3
#fi

echo "### Install ngrok ###"

#wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok

#echo "### Update user: $USER password ###"
#echo -e "$USER_PASS\n$USER_PASS" | sudo passwd "$USER"

echo "### Start ngrok proxy for 1 port ###"

sleep 10
rm -f .ngrok.log
./ngrok authtoken "$NGROK_TOKEN"
./ngrok tcp 5901 --log ".ngrok.log" &

sleep 10
HAS_ERRORS=$(grep "command failed" < .ngrok.log)

if [[ -z "$HAS_ERRORS" ]]; then
#for((i=1;i<=60;i++))
#do
echo ""
echo "=========================================="
echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\// 地址 /" | sed "s/:/ 端口 /")"
echo "=========================================="
#sleep 5
#done
else
  echo "$HAS_ERRORS"
  exit 4
fi

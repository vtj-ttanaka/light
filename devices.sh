#!/bin/bash

token=''
secret=''
t=$(date +%s%3N)
nonce=$(uuidgen)
# uuidgenが入っていないLinux環境なら↓
#nonce=$(< /proc/sys/kernel/random/uuid)
sign=$(echo -n "$token$t$nonce" | openssl dgst -binary -sha256 -hmac "$secret" | base64)
curl -Ss -H "Authorization: $token" -H "t: $t" -H "nonce: $nonce" -H "sign: $sign" https://api.switch-bot.com/v1.1/devices

#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set ssserver "$@"
fi

if [ -z $SERVER_PORT ]; then
  SERVER_PORT="8388"
fi

if [ -z $PASSWORD ]; then
  PASSWORD="123456"
fi

cat >/etc/shadowsocks.json<<-EOF
{
    "server":"::",
    "server_port":$SERVER_PORT,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"$PASSWORD",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
EOF

exec "$@"

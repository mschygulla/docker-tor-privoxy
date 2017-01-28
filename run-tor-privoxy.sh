#!/bin/bash

echo "Starting Tor"
/usr/bin/tor --runasdaemon 1 --defaults-torrc /usr/share/tor/defaults-torrc -f /etc/tor/torrc
echo "Starting Privoxy"
/usr/sbin/privoxy --pidfile /run/privoxy.pid --user privoxy /etc/privoxy/config

tail -f /var/log/privoxy/*
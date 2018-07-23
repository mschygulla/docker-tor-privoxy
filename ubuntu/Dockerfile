FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends tor privoxy \
      && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^listen-address/#listen-address/g' /etc/privoxy/config \
      && echo 'forward-socks4a / 127.0.0.1:9050 .' >> /etc/privoxy/config \
      && echo 'listen-address  :8118' >> /etc/privoxy/config

ADD run-tor-privoxy.sh /run-tor-privoxy.sh

EXPOSE 8118
CMD ["/run-tor-privoxy.sh"]
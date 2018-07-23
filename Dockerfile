FROM centos:7

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y update && \
    yum -y install tor privoxy && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN sed -i 's/^listen-address/#listen-address/g' /etc/privoxy/config && \
    echo 'forward-socks4a / 127.0.0.1:9050 .' >> /etc/privoxy/config && \
    echo 'listen-address  :8118' >> /etc/privoxy/config

ADD run-tor-privoxy.sh /run-tor-privoxy.sh

EXPOSE 8118
CMD ["/run-tor-privoxy.sh"]
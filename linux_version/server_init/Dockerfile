FROM debian:stretch


LABEL maintainer="info@enforge.de"

# 1 - update and install software
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y easy-rsa openvpn && \
apt-get clean -y && \
rm -rf /tmp/* /var/tmp/* /var/cache/apt/* /var/cache/distfiles/*

COPY vars /vars
COPY openvpn-ca_init.sh /openvpn-ca_init.sh

RUN chmod +x /openvpn-ca_init.sh

#CMD [".", "/openvpn-ca_init.sh"]
CMD ["/bin/bash", "/openvpn-ca_init.sh"]
#CMD [/openvpn-ca_init.sh]
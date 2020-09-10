FROM tillhoff/debian

RUN apt-get install -y \
  openvpn

COPY ./bin /usr/local/bin

RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD openvpn /etc/openvpn/openvpn.conf

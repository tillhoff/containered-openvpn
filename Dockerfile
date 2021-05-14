FROM thetillhoff/debian

RUN apt-get install -y \
  openvpn

COPY ./bin /usr/local/bin

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD mkdir -p /dev/net && mknod /dev/net/tun c 10 200 && openvpn /openvpn.conf

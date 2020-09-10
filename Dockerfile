FROM tillhoff/debian

RUN apt-get install -y \
  openvpn

COPY ./bin /usr/local/bin

RUN modprobe tun

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD openvpn /etc/openvpn/openvpn.conf

FROM tillhoff/debian

RUN apt-get install openvpn

COPY ./bin /usr/local/bin

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD openvpn /etc/openvpn/openvpn.conf

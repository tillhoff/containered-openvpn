FROM tillhoff/debian

RUN apt-get install openvpn

VOLUME ["/etc/openvpn"]

CMD openvpn /etc/openvpn/client/client.conf

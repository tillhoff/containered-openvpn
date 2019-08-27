FROM debian:stretch


LABEL maintainer="info@enforge.de"

# 1 - update
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get clean -y

# 2 - install software
RUN apt install -y openvpn

# 3 - configure variables
RUN rmdir /etc/openvpn/server
COPY client.conf /etc/openvpn/client/

# 4 - start software

#helping comments
#replace text in file
#RUN sed -i "s|origin text|new text |g" /etc/sysctl.conf

#delete multiple directories at once
#RUN rmdir /etc/openvpn/client /etc/openvpn/server
FROM debian:stretch


LABEL maintainer="info@enforge.de"

# 1 - update and install software
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y openvpn && \
apt-get clean -y && \
rm -rf /tmp/* /var/tmp/* /var/cache/apt/* /var/cache/distfiles/*


### add custom files
COPY ./server.conf /server.conf


# 4 - start software
#WORKDIR /etc/openvpn
EXPOSE 1194/udp
CMD openvpn /server.conf


#helping comments
#replace text in file
#RUN sed -i "s|origin text|new text |g" /etc/sysctl.conf

#delete multiple directories at once
#RUN rmdir /etc/openvpn/client /etc/openvpn/server
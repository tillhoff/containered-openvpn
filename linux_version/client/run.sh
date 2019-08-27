docker run --rm -it -v /home/shuroc/ovpn-client:/etc/openvpn openvpn-client



# --rm  removes the container after is exits
# -i    keep stdin open even if not attached
# -t    allocate a pseudo-tty
# -a    attach to stdin, stdout and/or stderr
# -v    attaches volume
# --volume      -v
# -h    container host name
# --hostname    -h
# --name        assign name to conatiner
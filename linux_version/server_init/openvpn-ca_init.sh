#!/bin/bash

# create ca-directory
make-cadir /etc/openvpn/ca
mv /vars /etc/openvpn/ca/vars

# sourcing vars file
source /etc/openvpn/ca/vars

# replace ./clean-all
mkdir "$KEY_DIR"&& chmod go-rwx "$KEY_DIR" && touch "$KEY_DIR/index.txt" && echo 01 >"$KEY_DIR/serial"

# configure openssl.cnf
cp /etc/openvpn/ca/openssl-1.0.0.cnf /etc/openvpn/ca/openssl.cnf

# replace ./build-ca
/etc/openvpn/ca/pkitool --initca

# replace ./build-key-server server
/etc/openvpn/ca/pkitool --server server

# replace ./build-key client1
/etc/openvpn/ca/pkitool client1

# depends on variable KEY_SIZE
/etc/openvpn/ca/build-dh

# create ta.key
openvpn --genkey --secret /etc/openvpn/ca/keys/ta.key
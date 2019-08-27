# testing purposes:
# Assuming an Ubuntu Docker image
# docker run -it <image> /bin/bash
# apt-get update -y && apt-get upgrade -y
# apt-get install iputils-ping // for ping
# apt-get install net-tools // for ifconfig


#$creds = Get-Credential
#New-SmbGlobalMapping -RemotePath \\NZXT\cold -Credential $creds -LocalPath O:

# variables
$path="C:\temp"

# environment
if((Test-Path -Path $path)) {
    Read-Host "Are you sure you want to delete your current folder at $($path)?"
    rm -recurse -force $path
}
mkdir $path


# openvpn-ca-container
docker build ./server_init -t openvpn-ca_init
docker run --rm -it -v "$($path -replace '\\','/'):/etc/openvpn" --net none openvpn-ca_init


# sort files to destination
mkdir $path/server
cp $path/ca/keys/ca.crt $path/server/
cp $path/ca/keys/server.crt $path/server/
cp $path/ca/keys/server.key $path/server/
cp $path/ca/keys/ta.key $path/server/
cp $path/ca/keys/dh4096.pem $path/server/
cp ./server/server.conf $path/server/
cp ./server/ipp.txt $path/server/ipp.txt
mkdir $path/server/ccd
cp ./server/ccd/client1 $path/server/ccd/

mkdir $path/client1
cp $path/ca/keys/ca.crt $path/client1/
cp $path/ca/keys/client1.crt $path/client1/
cp $path/ca/keys/client1.key $path/client1/
cp $path/ca/keys/ta.key $path/client1/
cp $path/ca/keys/dh4096.pem $path/client1/
cp ./client/client1.conf $path/client1/


# # openvpn-server-container
# docker build ./server/Dockerfile -t openvpn-server
# docker run --rm -it -v "$($path -replace '\\','/')/server:/etc/openvpn" --net bridged_network --hostname openvpn-server -p 1194:1194 openvpn-server

# # openvpn-client1-container
# docker build ./client/Dockerfile -t openvpn-client1
# docker run --rm -it -v "$($path -replace '\\','/')/client1:/etc/openvpn" openvpn-client1 --hostname openvpn-client1

# ----------------------------------------------


# #docker run --rm -it -v /etc/openvpn:O:\OpenVPN_Server openvpn_server_initconfig openvpn_server_initconfig
# docker build ./server_init/
# docker run --rm -it -v /etc/openvpn:C:\temp openvpn_server_initconfig openvpn_server_initconfig





# docker-compose run --rm openvpn ovpn_genconfig -u udp://VPN.SERVERNAME.COM
# docker-compose run --rm openvpn ovpn_initpki


# docker network create --attachable=true --driver=bridge --subnet=172.20.20.0/24 --gateway=172.20.20.1 docker-net-vpn
# docker run --rm --net=none -it -v $PWD/files/openvpn:/etc/openvpn kylemanna/openvpn:2.4 ovpn_genconfig -u udp://vpn.example.com -N -d -c -p "route 172.20.20.0 255.255.255.0" -e "topology subnet"
# docker run --detach --name openvpn -v $PWD/files/openvpn:/etc/openvpn --net=docker-net-vpn --ip=172.20.20.2 -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn:2.4
# sudo sysctl -w net.ipv4.ip_forward=1
# sudo iptables -A FORWARD -i tun+ -j ACCEPT
# sudo ip route add 192.168.255.0/24 via 172.20.20.2
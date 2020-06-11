# openvpn-containered
 
I don't want to use the most popular [openvpn image of Kylemanna](https://github.com/kylemanna/docker-openvpn) because I'd like to learn more on the process and to know exactly what's going on. While I could also read into what Kylemanna did, I could also create my own image and have way more fun.

## usage

Data is stored in a volume at `/etc/openvpn`.

First run the image with `tillhoff/openvpn create-ca`.

To create certificates, run `tillhoff/openvpn create-server` or `tillhoff/openvpn create-client`, respectively.

To run openvpn, add a `/etc/openvpn/openvpn.conf` file via volume `/etc/openvpn`.

## TODO
- add create-dh, etc
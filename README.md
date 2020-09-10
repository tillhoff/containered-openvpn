# openvpn-containered
 
I don't want to use the most popular [openvpn image of Kylemanna](https://github.com/kylemanna/docker-openvpn) because I'd like to learn more on the process and to know exactly what's going on. While I could also read into what Kylemanna did, I could also create my own image and have way more fun.

## usage

- First, create a ca with `CANAME=<ca-name> task create-ca`.

- Next create your required certificates with either `SERVERNAME=<server-name> task create-server` or `CLIENTNAME=<client-name> task create-client` respectively

- To run openvpn with a config file, run either `task run-server` or `task run-client`. Make sure to edit at least the IP addresses marked with `X.X.X.X`.

> Data is stored in `./config`.

To configure the `client.conf` and `server.conf` with the ip of the server, run `task set-ip`.

> You can run all these tasks automatically with `task setup`.
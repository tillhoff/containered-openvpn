FROM mcr.microsoft.com/windows/servercore:ltsc2019

# install chocolatey
#RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# add openvpn-installer
COPY ./openvpn-install-2.4.7-I603.exe C:/openvpn-install.exe

# install openvpn silent
RUN C:/openvpn-install.exe /SELECT_OPENVPN=1 /SELECT_SERVICE=1 /SELECT_TAP=1 /SELECT_OPENSSL_UTILITIES=0 /SELECT_EASYRSA=0 /S

# openvpn startup command
CMD ["openvpn","C:/openvpn/server.conf"]
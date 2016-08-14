#!/bin/bash

###### Property of Robotics Club IIT Delhi ##############


# Set your variables here
Proxy=true
GitHub=true

# Proxy settings
if [ "$Proxy" = true ] ; then
echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"
http_proxy=http://10.10.78.22:3128
https_proxy=https://10.10.78.22:3128
no_proxy=.iitd.ac.in,.iitd.ernet.in
auto_proxy=http://www.cc.iitd.ernet.in/cgi-bin/proxy.btech
HTTP_PROXY=http://10.10.78.22:3128
HTTPS_PROXY=https://10.10.78.22:3128
NO_PROXY=.iitd.ac.in,.iitd.ernet.in
AUTO_PROXY=http://www.cc.iitd.ernet.in/cgi-bin/proxy.btech" > /etc/environment 


echo "Acquire::http::Proxy \"http://10.10.78.22:3128\";
Acquire::https::Proxy \"https://10.10.78.22:3128\";
Acquire::HTTP::PROXY \"http://10.10.78.22:3128\";
Acquire::HTTPS::PROXY \"https://10.10.78.22:3128\";" > /etc/apt/apt.conf.d/99proxy


echo "Acquire::http::Proxy \"http://10.10.78.22:3128\";
Acquire::https::Proxy \"https://10.10.78.22:3128\";
Acquire::HTTP::PROXY \"http://10.10.78.22:3128\";
Acquire::HTTPS::PROXY \"https://10.10.78.22:3128\";" > /etc/apt/apt.conf

echo "Done IIT Delhi Proxy Settings!!"
fi

# GitHub settings
if [ "$GitHub" = true ] ; then
git config --global http.proxy http://10.10.78.22:3128
echo "[url \"https://github.com/\"]
    insteadOf = git://github.com/
    insteadOf = ssh://git@github.com:
    insteadOf = git@github.com:"  > /.gitconfig

echo "Done Github Settings!!"
fi

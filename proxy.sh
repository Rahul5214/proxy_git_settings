#!/bin/bash

#************ Property of Robotics Club IIT Delhi ****************


#***************************************************************************
# Set your boolean variables here
Proxy=true
GitHub=true
SSH=true
PPA=true
Release=xenial    # define you ubuntu or debian release
Beagle=false

#*********************************************************************************
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

echo "IIT Delhi Proxy Settings done !!"
fi
#**********************************************************************

if [ "$PPA" = true ] ; then
# backup original sources.list file to sources.list.bak

echo "# Binary packages IIT Delhi
# ===============
deb http://repo.iitd.ernet.in/ubuntu $Release main restricted universe multiverse               
deb http://repo.iitd.ernet.in/ubuntu $Release-updates main restricted universe multiverse
deb http://repo.iitd.ernet.in/ubuntu $Release-security main restricted universe multiverse
# deb http://repo.iitd.ernet.in/ubuntu $Release-backports main restricted universe multiverse
# deb http://repo.iitd.ernet.in/ubuntu $Release-proposed main restricted universe multiverse

# Sources
# =======
# deb-src http://repo.iitd.ernet.in/ubuntu $Release main restricted universe multiverse
# deb-src http://repo.iitd.ernet.in/ubuntu $Release-updates main restricted universe multiverse
# deb-src http://repo.iitd.ernet.in/ubuntu $Release-security main restricted universe multiverse
# deb-src http://repo.iitd.ernet.in/ubuntu $Release-backports main restricted universe multiverse
# deb-src http://repo.iitd.ernet.in/ubuntu $Release-proposed main restricted universe multiverse" > /etc/apt/sources.list

echo "PPA settings done !!"
fi


#**********************************************************************
# GitHub settings
if [ "$GitHub" = true ] ; then 
echo "[url \"https://github.com/\"]
    insteadOf = git://github.com/
    insteadOf = ssh://git@github.com:
    insteadOf = git@github.com:"  > ~/.gitconfig

git config --global http.proxy http://10.10.78.22:3128    
git config --global user.email "rkhalliday1@gmail.com"
git config --global user.name "Rahul5214"
git config --global push.default simple
 
echo "Github Settings done !!"
fi
#**********************************************************************
if [ "$SSH" = true ] ; then
echo "HOST beagle
    HostName 192.168.7.2
    User root" > ~/.ssh/config

echo "SSH settings done !!"
fi
#**********************************************************************
    
############### Some extra Stuff for Beagle #################
# for kernel 3.8
if [ "$Beagle" = true ] ; then
echo "Setting Slots and pins path for beagle" 
export SLOTS=/sys/devices/bone_capemgr.*/slots >> ~/.bashrc
export PINS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pins >> ~/.bashrc
source ~/.bashrc
fi




#!/bin/bash

#************ Property of Robotics Club IIT Delhi ****************#

#***************************************************************************#
# Set your boolean variables here

Proxy=true
GitHub=true
SSH=true
PPA=true
Release=$(lsb_release -cs)
Architecture=$(uname -m)

#*********************************************************************************#
# Proxy settings
if [ "$Proxy" = true ]; then
echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"
http_proxy=http://10.10.78.22:3128
https_proxy=https://10.10.78.22:3128
no_proxy=.iitd.ac.in,.iitd.ernet.in
auto_proxy=http://www.cc.iitd.ernet.in/cgi-bin/proxy.btech
HTTP_PROXY=http://10.10.78.22:3128
HTTPS_PROXY=https://10.10.78.22:3128
NO_PROXY=.iitd.ac.in,.iitd.ernet.in
AUTO_PROXY=http://www.cc.iitd.ernet.in/cgi-bin/proxy.btech" > /etc/environment 


if [ ! -f /etc/apt/apt.conf.d/99proxy ]; then
touch /etc/apt/apt.conf.d/99proxy
fi
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
#**********************************************************************#

if [ "$PPA" = true ] ; then
if [ "$Architecture" = "x86_64" ]; then
if [ ! -f /etc/apt/sources.list.bak ]; then
# backup the original sources.list file to sources.list.bak
cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

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
fi

#**********************************************************************#
# GitHub settings
if [ "$GitHub" = true ] ; then 
echo "[url \"https://github.com/\"]
    insteadOf = git://github.com/
    insteadOf = ssh://git@github.com:
    insteadOf = git@github.com:"  > ~/.gitconfig

git config --global http.proxy http://10.10.78.22:3128    
git config --global push.default simple
echo "export GIT_SSL_NO_VERIFY=1" >> ~/.bashrc
echo "Github Settings done !!"
fi

#**********************************************************************#
if [ "$SSH" = true ] ; then
if [ "$Architecture" = "x86_64" ]; then
echo "HOST beagle
    HostName 192.168.7.2
    User root" > ~/.ssh/config

echo "SSH settings done !!"
fi
fi
#**********************************************************************#
# miscellaneous Terminal setting to make life easier

# only for laptop
if [ "$Architecture" = "x86_64" ]; then 
echo "alias proxy='cd /home/rahul/Downloads/beagle_setup/github_repos/proxy_git_settings'
alias beagle_command='gedit /home/rahul/Downloads/beagle_setup/documentation/beagle_command &'" >> ~/.bashrc
fi
##############################
# alias for beagel and laptop.

echo "alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias purge='sudo apt-get purge'
alias autoremove='sudo apt-get autoremove'
alias cd..='cd ..' 
alias nano='nano -c'
alias shutdown='shutdown -h now'" >> ~/.bashrc

############### Some extra Stuff for Beagle #################
# for setting path variables for slots and pins.
if [ "$Architecture" = "armv7l" ]; then 
echo "export PINGROUPS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pingroups
export PINMUX=/sys/kernel/debug/pinctrl/44e10800.pinmux/pinmux-pins
NODE_PATH=/usr/local/lib/node_modules" >> ~/.bashrc

if [ "$Release" = "wheezy" ]; then 
echo "export SLOTS=/sys/devices/bone_capemgr.*/slots
export PINS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pins" >> ~/.bashrc
fi 

if [ "$Release" = "jessie" ]; then
echo "export SLOTS=/sys/devices/platform/bone_capemgr/slots
export PINS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pins" >> ~/.bashrc 
fi

source ~/.bashrc
echo "Settings for Slots and Pins path done!!"
fi

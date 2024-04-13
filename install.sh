#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\n\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Install
    echo -e "\e[33;1mGithub: @pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Main
#----------------------------
echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
apt update && apt upgrade -y

echo -e "\e[34;1m[-] Install Python3 && Python3-pip \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
apt install python3 python3-pip

echo -e "\e[34;1m[-] Install mdadm \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
apt install mdadm

echo -e "\e[34;1m[-] Install Figlet\e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
python3 -m pip install figlet


#----------------------------
#exit
#----------------------------
echo -e "\e[1;77m[*] Exit ..... [*]\n\e[1;0m"
exit 0

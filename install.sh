#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash install.sh or sudo ./install.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Install
    echo -e "\e[33;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Main
#----------------------------

echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
apt update && apt upgrade -y

if ! [[ -x "$(command -v python3)" && -x "$(command -v pip)" ]]; then
    echo -e '\e[31;1m[-] python3 and python3-pip not installed. [-]\e[0m' >&2
    apt install python3 python3-pip
else
    echo -e "\e[34;1m[-] Install Python3 && Python3-pip \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
fi



if ! [[ -x "$(command -v mdadm)" ]]; then
    echo -e '\e[31;1m[-]mdadm not installed.[-]\e[0m' >&2
    apt install mdadm
else
    echo -e "\e[34;1m[-] Install mdadm \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
fi



if ! [[ -x "$(command -v figlet)" ]]; then
    echo -e '\e[37;1m[-]figlet não instalado.[-]\e[0m' >&2
    apt install figlet
else
    echo -e "\e[34;1m[-] Install Figlet\e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
fi


#----------------------------
#exit
#----------------------------
echo -e "\e[1;77m[*] Exiting ..... [*]\n\e[1;0m"
exit 0
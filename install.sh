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

#------------------------------------------------------------------------------------------------------------
# Identifica o OS
#------------------------------------------------------------------------------------------------------------
os=$(lsb_release -a | grep "Distributor ID:" | cut -d ":" -f2 | tr -d '\t') # Sistemas baseados em GNU/Linux
os_bsd=$(cat /etc/os-release | cut -d "=" -f2 | tr '\n' ' '| cut -d " " -f1) # Sistemas baseados em BSD

#------------------------------------------------------------------------------------------------------------
# Debian or Ubuntu
#------------------------------------------------------------------------------------------------------------
if [[ $os = "Debian" && $os = "Ubuntu" ]];then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    apt update && apt upgrade -y

    if ! [[ -x "$(command -v python3)" && -x "$(command -v pip)" ]]; then
        echo -e '\e[31;1m[-] python3 and python3-pip not installed. [-]\e[0m' >&2
        apt install python3 python3-pip
    else
        echo -e "\e[34;1m[-] Install Python3 && Python3-pip \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v mdadm)" ]]; then
        echo -e '\e[31;1m[-] mdadm not installed. [-]\e[0m' >&2
        apt install mdadm
    else
        echo -e "\e[34;1m[-] Install mdadm \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v figlet)" ]]; then
        echo -e '\e[37;1m[-] figlet not installed. [-]\e[0m' >&2
        apt install figlet
    else
        echo -e "\e[34;1m[-] Install Figlet\e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#------------------------------------------------------------------------------------------------------------
#Void Linux
#------------------------------------------------------------------------------------------------------------
if [[ $os = "VoidLinux" ]]; then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    xbps-install -Suy

    if ! [[ -x "$(command -v python3)" && -x "$(command -v pip)" ]]; then
        echo -e '\e[31;1m[-] python3 and python3-pip not installed. [-]\e[0m' >&2
        xbps-install -Sy python3 python3-pip
    else
        echo -e "\e[34;1m[-] Install Python3 && Python3-pip \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v mdadm)" ]]; then
        echo -e '\e[31;1m[-] mdadm not installed. [-]\e[0m' >&2
        xbps-install -Sy mdadm
    else
        echo -e "\e[34;1m[-] Install mdadm \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v figlet)" ]]; then
        echo -e '\e[37;1m[-] figlet not installed. [-]\e[0m' >&2
        xbps-install -Sy figlet
    else
        echo -e "\e[34;1m[-] Install Figlet\e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#------------------------------------------------------------------------------------------------------------
#freebsd
#------------------------------------------------------------------------------------------------------------
if [[ $os_bsd = "FreeBSD" ]]; then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    pkg update && pkg upgrade

    if ! [[ -x "$(command -v python3)" && -x "$(command -v pip)" ]]; then
        echo -e '\e[31;1m[-] python3 and python3-pip not installed. [-]\e[0m' >&2
        pkg install python3 python3-pip
    else
        echo -e "\e[34;1m[-] Install Python3 && Python3-pip \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v mdadm)" ]]; then
        echo -e '\e[31;1m[-] mdadm not installed. [-]\e[0m' >&2
        pkg install mdadm
    else
        echo -e "\e[34;1m[-] Install mdadm \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v figlet)" ]]; then
        echo -e '\e[37;1m[-] figlet not installed. [-]\e[0m' >&2
        pkg install figlet
    else
        echo -e "\e[34;1m[-] Install Figlet\e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#------------------------------------------------------------------------------------------------------------
#Particionadores
#------------------------------------------------------------------------------------------------------------
# Debian or Ubuntu
#------------------------------------------------------------------------------------------------------------
if [[ $os = "Debian" && $os = "Ubuntu" ]];then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    apt update && apt upgrade -y

    if ! [[ -x "$(command -v parted)" ]]; then
        echo -e '\e[31;1m[-] parted not installed. [-]\e[0m' >&2
        apt install parted
    else
        echo -e "\e[34;1m[-] Install Parted \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v fdisk)" ]]; then
        echo -e '\e[31;1m[-] fdisk not installed. [-]\e[0m' >&2
        apt install fdisk
    else
        echo -e "\e[34;1m[-] Install fdisk  \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v cfdisk)" ]]; then
        echo -e '\e[37;1m[-] cfdisk not instaled [-]\e[0m' >&2
        apt install figlet
    else
        echo -e "\e[34;1m[-] Install cfdisk \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#------------------------------------------------------------------------------------------------------------
#Void Linux
#------------------------------------------------------------------------------------------------------------
if [[ $os = "VoidLinux" ]];then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    xbps-install -Suy

    if ! [[ -x "$(command -v parted)" ]]; then
        echo -e '\e[31;1m[-] parted not installed. [-]\e[0m' >&2
        xbps-install -Sy parted
    else
        echo -e "\e[34;1m[-] Install Parted \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v fdisk)" ]]; then
        echo -e '\e[31;1m[-] fdisk not installed. [-]\e[0m' >&2
        xbps-install -Sy fdisk
    else
        echo -e "\e[34;1m[-] Install fdisk  \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v cfdisk)" ]]; then
        echo -e '\e[37;1m[-] cfdisk not instaled [-]\e[0m' >&2
        xbps-install -SY figlet
    else
        echo -e "\e[34;1m[-] Install cfdisk \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#------------------------------------------------------------------------------------------------------------
# FreeBSD
#------------------------------------------------------------------------------------------------------------
if [[ $os_bsd = "FreeBSD" ]];then
    echo -e "\e[34;1m[-] Update && Upgrade \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    pkg update && pkg upgrade

    if ! [[ -x "$(command -v parted)" ]]; then
        echo -e '\e[31;1m[-] parted not installed. [-]\e[0m' >&2
        pkg install parted
    else
        echo -e "\e[34;1m[-] Install Parted \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v fdisk)" ]]; then
        echo -e '\e[31;1m[-] fdisk not installed. [-]\e[0m' >&2
        pkg install fdisk
    else
        echo -e "\e[34;1m[-] Install fdisk  \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi


    if ! [[ -x "$(command -v cfdisk)" ]]; then
        echo -e '\e[37;1m[-] cfdisk not instaled [-]\e[0m' >&2
        pkg install figlet
    else
        echo -e "\e[34;1m[-] Install cfdisk \e[0m(\e[32;1mOk\e[0m)\e[34;1m[-] \e[0m"
    fi
fi

#----------------------------
#exit
#----------------------------
echo -e "\e[1;77m[*] Exiting ..... [*]\n\e[1;0m"
exit 0
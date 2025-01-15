#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash raid-0.sh or sudo ./raid-0.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){
    figlet Raid 0
    echo -e "\e[37;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Var
#----------------------------

export nameraid=/dev/md0
export hmd=2
export fsys=ext4
export LANG=C
export LC_ALL=C 

#-----------------------------------
# Functions
#-----------------------------------

function help() {

    echo -e "\e[37;1mHelp Menu: "
    echo -e ""
    echo -e "\t \e[37;1mhelp        | Help Menu"
    echo -e "\t \e[37;1mexit        | Exit the program"
    echo -e "\t \e[37;1mclear       | Clean the screen"
    echo -e "\t \e[37;1mback        | Go back to the root"
    echo -e "\t \e[37;1mbanner      | Activate the Banner"
    echo -e "\t \e[37;1mdevices     | Active Devices"
    echo -e "\e[0m"
}

function debug() {
    echo "Teste"
}

function raid0() {

    echo -e "\e[37;1mRaid 0:"

    read -p "Name for RAID (Ex: md0): " nameraid

    read -p "How many devices (2-8): " hmd

    if [[ "$hmd" >= 2 || "$hdm" <= 8 ]]; then
        echo -e "\e[31;1mPlease, choose between 2 to 8 devices!\e[0m"
        exit 1
    fi

    declare -a devices 
    for (( i=0; i<= $hdm; i++ ));do
        read -p "Device $i (Ex: /dev/sdX): " device
        if [[ ! -b "$device" ]];then
            echo -e "\e[31;1mDevice $device does not exist or is not a block device!\[0m"
            exit 1
        fi
        devices+=("$device")
    done
        
    filemdadm=/etc/mdadm/mdadm.conf
    if [[ ! -e "$filemdadm" ]]; then
        echo -e "\e[31;1mThe \e[37;1m$filemdadm \e[31;1mdoes not exist!\e[0m"
        exit
    fi

    read -p "Filesystem (ext4 ou btrfs): " fsys

    if [[ "$fsys" != "ext4" && "$fsys" != "btrfs" ]];then
        echo -e "\e[31;1mPlease, choose ext4 or btrfs!\n\e[0m"
        exit
    fi

    # Criação da Raid | Montagem | Tipo de filesystem
    echo -e "\e[30;1m[*] Creating the raid [*]"
    echo -e "\e[0m"
    mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices=$hdm "${devices[@]}"

    echo -e "\e[30;1m[*] Creating the filesystem [*]"
    echo -e "\e[0m"
    mkfs.$fsys /dev/$nameraid

    echo -e "\e[30;1m[*] Creating the directory [*]"
    echo -e "\e[0m"
    mkdir -p /mnt/$nameraid

    echo -e "\e[30;1m[*] Mounting /dev/$nameraid in /mnt/$nameraid [*]"
    echo -e "\e[0m"
    mount /dev/$nameraid /mnt/$nameraid

    echo -e "\e[30;1m[*] Creating the mdadm configuration [*]"
    echo -e "\e[0m"
    mdadm --detail --scan >> /etc/mdadm/mdadm.conf

    echo -e "\e[30;1m[*] Updating initramfs [*]"
    echo -e "\e[0m"
    update-initramfs -u

    echo -e "\e[30;1m[*] Creating the raid mount in /etc/fstab [*]"
    echo -e "\e[0m"
    echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab
}

#----------------------------
# Main
#----------------------------
while true ;do

    #----------------------------
    # Menu
    #----------------------------
    echo -e "\e[37;1mMenu: "
    echo -e "\t \e[37;1m1. Raid Config"
    echo -e "\t \e[37;1m0. Back"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/src/raid# " opt

    # Testing
    case $opt in

        1)
            raid0 ;;

        #-----------------------------------------
       
        help)
            help ;;

        exit|0)
            echo -e "\e[32;1m[*] Exiting ..... [*]\n\e[0m"
            exit 1 ;;

        clear)
            clear ;;

        back)
            exit 0 ;;

        banner)
            banner1 ;;

        version)
            echo ""
            echo -e "\e[37;1mVersion: 1.2\e[0m" 
            echo "" ;;

        devices)
            echo ""
            echo -e "\e[37;1mDevices: "
            echo -e "\e[34;1m"
            lsblk -n | awk '/NAME/ {print; next} {print "\t" $1, "(" $4 ")", $6}' | grep -vE "├─|└─" 
            echo -e "\e[0m";;

        *)
            echo -e "\e[31;1m[*] Error in the program! [*]\n\e[0m"
            sleep 1
            exit 1;;

    esac

done

#----------------------------
#exit
#----------------------------
echo -e "\e[32;1m[*] Exiting ..... [*]\n\e[0m"
sleep 1
exit 0

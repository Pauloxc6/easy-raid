#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash part.sh or sudo ./part.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Partition
    echo -e "\e[33;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Var
#----------------------------

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

#----------------------------
# Main
#----------------------------
while true ;do

    #----------------------------
    # Menu
    #----------------------------
    echo -e "\e[37;1mMenu: "
    echo -e "\t \e[37;1m1. Parted"
    echo -e "\t \e[37;1m2. Fdisk"
    echo -e "\t \e[37;1m3. Cfdisk"
    echo -e "\t \e[37;1m0. Back"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/src/# " opt

    # Testing
    case $opt in

        1)
            ./src/partition/part-1.sh ;;

        2)
            ./src/partition/part-2.sh ;;

        3)
            ./src/partition/part-3.sh ;;

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
            exit 1 ;;

    esac

done

#----------------------------
#exit
#----------------------------
echo -e "\e[1;77m[*] Exiting ..... [*]\n\e[1;0m"
sleep 1
exit 0

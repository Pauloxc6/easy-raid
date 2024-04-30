#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash part-1.sh or sudo ./part-1.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){
    figlet parted
    echo -e "\e[37;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Var
#----------------------------

fsys=ext4
dev1=/dev/sda


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

function part1() {

    echo -e "\e[37;1mParted: \e[0m"

    echo -e "\e[37;1m1. List Patitions"
    echo -e "\e[37;1m2. Create a Patition"

    read -p "> " opt

    if [[ $opt -eq 1 ]]; then
        echo -e "\e[37;1mList Patitions: "
        parted --list

    elif [[ $opt -eq 2 ]]; then
        echo -e "\e[37;1mCreate a Patition"
        read -p "Mode Interactive (int) or Mode Command Line Interface (cli)" mode

        if [[ $mode = "int" ]]; then
            read -p "Device: " dev1
            parted $dev1

        elif [[ $mode = "cli" ]]; then
            continue

        else
            echo -e "\e[31;1m[+] Please, choose int or cli! [+]\e[0m"
            exit 1
        fi

    else
        echo -e "\e[31;1m[+] Please, choose 1 or 2! [+]\e[0m"
        exit 1
    fi
}

#----------------------------
# Main
#----------------------------
while true ;do

    #----------------------------
    # Menu
    #----------------------------
    echo -e "\e[37;1mMenu: "
    echo -e "\t \e[37;1m1. Parted Config"
    echo -e "\t \e[37;1m0. Exit"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/src/partition/# " opt

    # Testing
    case $opt in

        1)
            part1 ;;

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
            echo -e "\e[37;1mVersion: 1.0\e[0m" 
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

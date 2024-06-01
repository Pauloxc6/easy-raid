#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash raid.sh or sudo ./raid.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Easy Raid
    echo -e "\e[33;1mGithub: @Pauloxc6 | \t $(date)\e[0m"
}

banner1

#----------------------------
# Var
#----------------------------

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
    echo -e "\t \e[37;1mshow        | Show Raids"
    echo -e "\t \e[37;1mdevices     | Active Devices"
    echo -e "\e[0m"
}

function debug() {
    echo "Teste"
}

function sr() {

    filemdadm=/etc/mdadm/mdadm.conf
    if [[ ! -e "$filemdadm" ]]; then
        echo -e "\e[31;1mThe \e[37;1m$filemdadm \e[31;1mdoes not exist!\e[0m"
        exit
    fi

    echo ""
    echo -e "\e[37;1mRaids: "
    echo -e "\e[34;1m"
    cat /etc/mdadm/mdadm.conf | awk '/ARRAY/ {print; next} {print "\t" $0}' | grep -vE "#|HOMEHOST <system>|MAILADDR root" | sed '/^$/d' | tr -d "\n"

    savedev=$(cat /etc/mdadm/mdadm.conf | grep ARRAY | cut -d " " -f2)

    echo -e "\e[37;1mDevices: \e[34;1m"
    mdadm --detail $savedev | grep -o "/dev/[^ ]*" | grep -v "$savedev:" | awk '/$savedev/ {print; next} {print "\t" $0}'

    echo -e "\e[0m"
}

#----------------------------
# Main
#----------------------------
while true ;do

    #----------------------------
    # Menu
    #----------------------------
    echo -e "\e[37;1mMenu: "
    echo -e "\t \e[37;1m1. Raid 0"
    echo -e "\t \e[37;1m2. Raid 1"
    echo -e "\t \e[37;1m3. Raid 5"
    echo -e "\t \e[37;1m4. Raid 10"
    echo -e "\t \e[37;1m0. Back"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/src/# " opt

    # Testing
    case $opt in

        1)
            ./src/raid/raid-0.sh ;;

        2)
            ./src/raid/raid-1.sh ;;

        3)
            ./src/raid/raid-5.sh ;;

        4)
            ./src/raid/raid-10.sh ;;

        #-----------------------------------------
       
        help)
            help ;;

        exit|0)
            echo -e "\e[32;1m[*] Exiting ..... [*]\n\e[0m"
            exit 1;;

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

        show)
            sr ;;

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
echo -e "\e[32;1m[*] Exitint ..... [*]\n\e[0m"
sleep 1
exit 0

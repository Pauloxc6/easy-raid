#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash main.sh or sudo ./main.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Easy Raid
    echo -e "\e[33;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
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
    echo -e "\t \e[37;1m1. Raid Config"
    echo -e "\t \e[37;1m2. Remove Raid"
    echo -e "\t \e[37;1m0. Exit"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/# " opt

    # Testing
    case $opt in

        1)
            ./src/raid.sh ;;

        2)
            ./src/remove.sh ;;

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

        *)
            echo -e "\e[31;1m[*] Error in the program! [*]\n\e[0m"
            sleep 1
            exit 1 ;;

    esac

done

#----------------------------
#exit
#----------------------------
echo -e "\e[1;77m[*] Exiting ..... [*]\n\e[1;0m"
sleep 1
exit 0

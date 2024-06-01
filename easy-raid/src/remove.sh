#!/usr/bin/env bash
#-----------------------------
# Root Testing
#-----------------------------
if [[ "$(id -u)" -ne 0 ]];then
    echo -e "\e[37;1mPlease, run this program as root!\e[0m"
    echo -e "\e[37;1mHelp: sudo bash remove.sh or sudo ./remove.sh\e[0m"
    exit 1
fi

#------------------------------------
# Banner
#------------------------------------
function banner1(){

    figlet Remove Raid
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
    echo -e "\t \e[37;1mshow        | Show Raids"
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
    cat /etc/mdadm/mdadm.conf | awk '/ARRAY/ {print; next} {print $0}' | grep -vE "#|HOMEHOST <system>|MAILADDR root" | sed '/^$/d' | tr -d "\n" | echo -e "\n"

    savedev=$(cat /etc/mdadm/mdadm.conf | grep ARRAY | cut -d " " -f2)

    if [[ -z $savedev ]]; then
        echo -e "\e[31;1mThe file \e[37;1m/etc/mdadm/mdadm \e[31;1mnot found or file void!\e[0m"
        exit
    fi

    echo -e "\e[37;1m\nDevices: \e[34;1m"
    mdadm --detail $savedev | grep -o "/dev/[^ ]*" | grep -v "$savedev:" | awk '/$savedev/ {print; next} {print "\t" $0}'

    echo -e "\e[0m"
}

function rr(){

    filemdadm=/etc/mdadm/mdadm.conf
    if [[ ! -e "$filemdadm" ]]; then
        echo -e "\e[31;1mThe \e[37;1m$filemdadm \e[31;1mdoes not exist!\e[0m"
        exit
    fi

    savedev=$(cat /etc/mdadm/mdadm.conf | grep ARRAY | cut -d " " -f2)
    devis=$(mdadm --detail $savedev | grep -o "/dev/[^ ]*" | grep -v "$savedev:")

    if [[ -z $savedev && -z $devis ]]; then
        echo -e "\e[31;1mThe file \e[37;1m/etc/mdadm/mdadm \e[31;1mnot found or file void!\e[0m"
        exit
    fi

    mpoint=$(cat /etc/fstab | cut -d " " -f2 | grep /mnt/)
    if ! mountpoint -q -- $savedev; then
        echo -e "\e[37;1mDevice mounted in $mp!\e[0m"
        read -p "Deseja demostar $mp (y/n)? " yn
        if [[ $yn = "y" ]]; then
            umount $mpoint
        else
            exit 1      
        fi  
    else
        echo -e "\e[31;1mDevice not mounted!\e[0m"
        exit 1
    fi

    echo -e "\e[37;1mStop /dev/$savedev\e[0m"    
    mdadm --stop $savedev

    echo -e "\e[37;1mRemove /dev/$savedev\e[0m"    
    mdadm --remove $savedev

    for items in "${devis[@]}";do
        echo -e "\e[37;1mZero Superblock : $items \e[37;1m"
        mdadm --zero-superblock $items
    done
}


#----------------------------
# Main
#----------------------------
while true ;do

    #----------------------------
    # Menu
    #----------------------------
    echo -e "\e[37;1mMenu: "
    echo -e "\t \e[37;1m1. Remove Raid"
    echo -e "\t \e[37;1m0. Back"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/src/# " opt

    # Testing
    case $opt in

        1)
            rr ;;

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

        show)
            sr ;;

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

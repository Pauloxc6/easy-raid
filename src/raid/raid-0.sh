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
    figlet Raid 0
    echo -e "\e[37;1mGithub: @pauloxc6 | \t $(date) \e[0m"
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
    echo -e "\t \e[37;1mdevices     | Active Devices"
    echo "\e[0m"
}

function debug() {
    echo "Teste"
}

function raid0() {

    echo -e "\e[37;1mRaid 0:"

    read -p "Name for RAID (Ex: md0): " nameraid

    read -p "How many devices: " hmd

    if [[ $hmd -eq 2 ]];then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2

        echo -e "\e[30;1m[*] Criando o filesystem [*]"
        echo -e "\e[0m"
        mkfs.$fsys /dev/$nameraid

        echo -e "\e[30;1m[*] Criando o diretorio [*]"
        echo -e "\e[0m"
        mkdir -p /mnt/$nameraid

        echo -e "\e[30;1m[*] Motando /dev/$nameraid /mnt/$nameraid [*]"
        echo -e "\e[0m"
        mount /dev/$nameraid /mnt/$nameraid

        echo -e "\e[30;1m[*] Criando a configuração do mdadm [*]"
        echo -e "\e[0m"
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf

        echo -e "\e[30;1m[*] Atualizando o initramfs [*]"
        echo -e "\e[0m"
        update-initramfs -u

        echo -e "\e[30;1m[*] Criando a motagem da raid em /etc/fstab [*]"
        echo -e "\e[0m"
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 3 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 4 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3 $dev4
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 5 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 6 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5
        read -p "Device 5 (EX: /dev/sdg): " dev6

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 7 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5
        read -p "Device 4 (EX: /dev/sdg): " dev6
        read -p "Device 5 (EX: /dev/sdh): " dev7

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6 $dev7
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    elif [[ $hmd -eq 8 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5
        read -p "Device 3 (EX: /dev/sdg): " dev6
        read -p "Device 4 (EX: /dev/sdh): " dev7
        read -p "Device 5 (EX: /dev/sdi): " dev8

        read -p "Filesystem (ext4 ou btrfs): " fsys

        # Criação da Raid | Montagem | Tipo de filesystem
        mdadm --create --verbose /dev/$nameraid --level=0 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6 $dev7 $dev8
        mkfs.$fsys /dev/$nameraid
        mkdir -p /mnt/$nameraid
        mount /dev/$nameraid /mnt/$nameraid
        mdadm --detail --scan >> /etc/mdadm/mdadm.conf
        update-initramfs -u
        echo "/dev/$nameraid /mnt/$nameraid $fsys defaults,nofail,discard 0 0" >> /etc/fstab

    else
        echo -e "\e[31;1m[+] Limite Atingindo para o programa [+]\e[0m"
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
    echo -e "\t \e[37;1m1. Raid Config"
    echo -e "\t \e[37;1m0. Exit"

    echo -e "\e[0m"

    read -p "root@server:~/easy-raid/# " opt

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
            echo -e "\e[37;1mVersion: 1.0\e[0m" 
            echo "" ;;

        devices)
            echo ""
            echo -e "\e[37;1mDevices: "
            echo -e "\e[34;1m"
            lsblk -n | awk '/NAME/ {print; next} {print "\t" $1}' | grep -vE "├─|└─" 
            echo -e "\e[0m";;

        *)
            echo -e "\e[31;1m[*] Erro no programa! [*]\n\e[0m"
            sleep 1
            exit 1 ;;

    esac

done

#----------------------------
#exit
#----------------------------
echo -e "\e[32;1m[*] Exit ..... [*]\n\e[0m"
sleep 1
exit 0

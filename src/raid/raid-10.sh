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
    figlet Raid 10
    echo -e "\e[37;1mGithub: @Pauloxc6 | \t $(date) \e[0m"
}

banner1

#----------------------------
# Var
#----------------------------

nameraid=/dev/md0
hmd=2
fsys=ext4
dev1=/dev/sdb 
dev2=/dev/sdc 
dev3=/dev/sdd
dev4=/dev/sde
dev5=/dev/sdf
dev6=/dev/sdg
dev7=/dev/sdh
dev8=/dev/sdi

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

    echo -e "\e[37;1mRaid 10:"

    read -p "Name for RAID (Ex: md0): " nameraid

    read -p "How many devices: " hmd

    if [[ $hmd -eq 2 ]];then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2

        read -p "Filesystem (ext4 ou btrfs): " fsys

        if [[ $fsys != "ext4" || $fsys != "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\n\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2

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

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3

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

    elif [[ $hmd -eq 4 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4

        read -p "Filesystem (ext4 ou btrfs): " fsys

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3 $dev4

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

    elif [[ $hmd -eq 5 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5

        read -p "Filesystem (ext4 ou btrfs): " fsys

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5

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

    elif [[ $hmd -eq 6 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5
        read -p "Device 5 (EX: /dev/sdg): " dev6

        read -p "Filesystem (ext4 ou btrfs): " fsys

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6
        
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

    elif [[ $hmd -eq 7 ]]; then

        read -p "Device 1 (Ex: /dev/sdb): " dev1
        read -p "Device 2 (EX: /dev/sdc): " dev2
        read -p "Device 3 (EX: /dev/sdd): " dev3
        read -p "Device 4 (EX: /dev/sde): " dev4
        read -p "Device 5 (EX: /dev/sdf): " dev5
        read -p "Device 4 (EX: /dev/sdg): " dev6
        read -p "Device 5 (EX: /dev/sdh): " dev7

        read -p "Filesystem (ext4 ou btrfs): " fsys

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6 $dev7
        
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

        if [[ $fsys -ne "ext4" || $fsys -ne "btrfs" ]];then
            echo -e "\e[31;1mPlease, choose ext4 or btrfs!\e[0m"
            exit 1
        fi

        # Criação da Raid | Montagem | Tipo de filesystem
        echo -e "\e[30;1m[*] Criando a raid [*]"
        echo -e "\e[0m"
        mdadm --create --verbose /dev/$nameraid --level=10 --raid-devices $dev1 $dev2 $dev3 $dev4 $dev5 $dev6 $dev7 $dev8
        
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

    elif [[ $hmd -lt 1 || $hmd -gt 9 ]];then
        echo -e "\e[31;1mPlease, choose between 2 or 8 devices!\e[0m"
        exit 1

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

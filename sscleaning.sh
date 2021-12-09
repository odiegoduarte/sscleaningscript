#!/bin/bash

#Criado por Diego Duarte 2020 - 2021

# SSCleaning V4 é um simples shell script que foi criado para fazer a limpeza 
# automatizada do sistema, utilizando comandos do APT.
# Esse shell script utiliza o whiptail para gerar caixas de diálogo.

function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}

export NEWT_COLORS='
window=,black
border=white,black
textbox=white,black
button=black,white
'
whiptail ...
 {
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge " Iniciando SSCleaning V4 " 7 60 0

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="SSCleaning V4"
TITLE="SSCleaning V4"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Iniciar limpeza completa"
         2 "Limpar runtimes obsoletas do flatpak"
         3 "Limpar cache apt e .deb obsoletos"
         4 "Limpar cache Spotify"
         5 "Limpar cache das miniaturas"
         6 "Sair"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in

        1)
echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered "Iniciando a limpeza completa do sistema"
echo -e

## "Definir o numero máximo de revisões de um snap armazenadas pelo sistema após a proxima atualização."
sudo snap set system refresh.retain=2

echo -e
print_centered "-"  "-" 
print_centered "> Removendo runtimes obsoletas do flatpak <"
print_centered "-"  "-"
 
flatpak uninstall --unused -y

echo -e
print_centered "-"  "-" 
print_centered "> Removendo dependências obsoletas sistema <"
print_centered "-"  "-" 

sudo apt autoremove -y

echo Cache do apt
sudo du -sh /var/cache/apt

echo -e
print_centered "-"  "-" 
print_centered "> Limpando o cache do apt e .deb obsoletos <"
print_centered "-"  "-" 

sudo apt autoclean -y
sudo apt clean -y

echo -e
print_centered "-"  "-" 
print_centered "> Limpando cache de miniaturas <"
print_centered "-"  "-" 

du -sh ~/.cache/thumbnails

echo -e
print_centered "-"  "-" 
print_centered "> Limpando cache do Spotify <"
print_centered "-"  "-" 

sudo rm -rf ~/.cache/spotify/Data/*
sudo rm -rf ~/.cache/spotify/Storage/*

echo -e
print_centered "-"  "-" 
print_centered "> Limpeza concluida, aperte a tecla ENTER para voltar ao menu <"
print_centered "-"  "-"
echo -e
            
read
./sscleaning.sh
            ;;

        2)
            echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered "Removendo as runtimes obsoletas do flatpak"
echo -e
            
flatpak uninstall --unused -y
         
echo -e
print_centered "-"  "-" 
print_centered "> Limpeza concluida, aperte a tecla ENTER para voltar ao menu <"
print_centered "-"  "-"
echo -e
            
read
./sscleaning.sh
            ;;

        3)
echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered " Limpando cache do APT, miniaturas e .deb obsoletos "
echo -e
   
sudo du -sh /var/cache/apt
sudo apt autoclean -y
sudo apt clean -y
du -sh ~/.cache/thumbnails

echo -e
print_centered "-"  "-" 
print_centered "> Limpeza concluida, aperte a tecla ENTER para voltar ao menu <"
print_centered "-"  "-"
echo -e

read
./sscleaning.sh
            ;;                  

        4)
echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered " Limpando cache do Spotify "
echo -e

sudo rm -rf ~/.cache/spotify/Data/*
sudo rm -rf ~/.cache/spotify/Storage/*

echo -e
print_centered "-"  "-" 
print_centered "> Limpeza concluida, aperte a tecla ENTER para voltar ao menu <"
print_centered "-"  "-"
echo -e
            
read
./sscleaning.sh
            ;;

        5)
echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered " Limpando cache miniaturas "
echo -e
   
du -sh ~/.cache/thumbnails
      
echo -e
print_centered "-"  "-" 
print_centered "> Limpeza concluida, aperte a tecla ENTER para voltar ao menu <"
print_centered "-"  "-"
echo -e
            
read
./sscleaning.sh
            ;;

        6)

exit
            ;;            
            
esac
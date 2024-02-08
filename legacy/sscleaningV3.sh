#!/bin/bash

#Criado por Diego Duarte 2020 - 2021

# SSCleaning V2 é um simples shell script que foi criado para fazer a limpeza 
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

echo -e

print_centered "███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
print_centered "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
print_centered "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
print_centered "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
print_centered "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
print_centered "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "

print_centered "É um simples shellscript que faz uma limpeza automatizada do sistema."
echo -e

{
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Iniciando o SSCleaning" 6 50 0

if (whiptail --title " Seja bem-vindo(a)$(whoami) " --yesno "SSCleaning é um simples shell script que foi criado para fazer a limpeza automatizada do sistema.
No próximo passo irá te pedir a senha de usuário.
Deseja continuar ?" 10 60) then
    echo "Iniciando limpeza . . . "
else
    echo "Limpeza cancelada.$6 "
fi

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

echo -e
print_centered "-"  "-" 
print_centered "> Verificando cache do apt <"
print_centered "-"  "-" 

sudo du -sh /var/cache/apt

echo -e
print_centered "-"  "-" 
print_centered "> Removendo pacotes obsoletos <"
print_centered "-"  "-" 

sudo apt autoclean -y
sudo apt clean -y

echo -e
print_centered "-"  "-" 
print_centered "> Limpando o cache de miniaturas <"
print_centered "-"  "-" 

du -sh ~/.cache/thumbnails

echo -e
print_centered "-"  "-" 
print_centered "> Limpando o cache do Spotify <"
print_centered "-"  "-" 

sudo rm -rf ~/.cache/spotify/Data/*
sudo rm -rf ~/.cache/spotify/Storage/*

## Limpeza finalizada !
echo -e
print_centered "-"  "-" 
print_centered "> Limpeza finalizada ! <"
print_centered "-"  "-" 
echo -e
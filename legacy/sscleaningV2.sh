#!/bin/bash

#Criado por Diego Duarte 2020

# SSCleaning V2 é um simples shell script que foi criado para fazer a limpeza 
# automatizada do sistema, utilizando comandos do APT.
# Esse shell script utiliza o whiptail para gerar caixas de diálogo.

echo -e "

███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║
███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝                                                                                                                                                                                                                                                                                   

"

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

echo "Removendo runtimes obsoletas do flatpak" 
flatpak uninstall --unused -y

echo "Removendo dependências obsoletas sistema."
sudo apt autoremove -y

echo "Verificando cache do apt"
sudo du -sh /var/cache/apt

echo "Removendo pacotes obsoletos."
sudo apt autoclean -y
sudo apt clean -y

echo "Limpando o cache de miniaturas."
du -sh ~/.cache/thumbnails

echo "Limpando o cache do Spotify."
sudo rm -rf ~/.cache/spotify/Data/*
sudo rm -rf ~/.cache/spotify/Storage/*

## Limpeza finalizada !
echo "Limpeza finalizada !"

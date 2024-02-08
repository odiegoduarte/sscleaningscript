#!/bin/bash

#Criado por Diego Duarte 2020 - 2024

# SSCleaning V4 é um simples shell script que foi criado para fazer a limpeza 
# automatizada do sistema, utilizando comandos do APT e do flatpak

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

while true; do
    clear
    echo
    echo " ██████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ "
    echo "██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ "
    echo "███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗"
    echo "╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║"
    echo "███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝"
    echo "╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "
    echo
    echo " Escolha uma das seguintes opções:"
    echo
    echo " 1. Iniciar limpeza completa"
    echo " 2. Limpar runtimes obsoletas do flatpak"
    echo " 3. Limpar cache apt e .deb obsoletos"
    echo " 4. Limpar cache Spotify"
    echo " 5. Limpar cache das miniaturas"
    echo " 6. Sair"
    echo

    read -r -p "Digite o número da opção desejada: " choice

    case $choice in
        1)
            clear
            echo -e "\nIniciando a limpeza completa do sistema..."
            
            sudo snap set system refresh.retain=2
            flatpak uninstall --unused -y
            sudo apt autoremove -y
            sudo du -sh /var/cache/apt
            sudo apt clean -y
            sudo apt autoclean -y
            sudo rm -rf ~/.cache/spotify/Data/*
            sudo rm -rf ~/.cache/spotify/Storage/*

            read -r -p "Limpeza concluída. Pressione Enter para continuar."
            ;;
        2)
            clear
            echo -e "\nRemovendo as runtimes obsoletas do flatpak..."

            flatpak uninstall --unused -y
            
            read -r -p "Limpeza concluída. Pressione Enter para continuar."
            ;;
        3)
            clear
            echo -e "\nLimpando cache do APT, miniaturas e .deb obsoletos..."

            sudo apt autoremove -y
            sudo du -sh /var/cache/apt
            sudo apt clean -y
            sudo apt autoclean -y

            read -r -p "Limpeza concluída. Pressione Enter para continuar."
            ;;
        4)
            clear
            echo -e "\nLimpando cache do Spotify..."

            sudo rm -rf ~/.cache/spotify/Data/*
            sudo rm -rf ~/.cache/spotify/Storage/*

            read -r -p "Limpeza concluída. Pressione Enter para continuar."
            ;;
        5)
            clear
            echo -e "\nLimpando cache miniaturas..."

            du -sh ~/.cache/thumbnails
            rm -rf ~/.cache/thumbnails/*

            read -r -p "Limpeza concluída. Pressione Enter para continuar."
            ;;
        6)
            clear
            echo -e "\nSaindo..."
            exit
            ;;
        *)
            echo -e "\nOpção inválida. Por favor, escolha uma opção válida."
            read -r -p "Pressione Enter para continuar."
            ;;
    esac
done

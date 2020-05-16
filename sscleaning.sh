#!/bin/bash

#Criado por Diego Duarte

# SSCleaning é um simples shell script que foi criado para fazer a limpeza 
# automatizada do sistema, utilizando comandos do APT.
# Esse shell scriot utiliza o zenity para gerar caixas de diálogo GTK.

echo -e "

███████╗███████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
██╔════╝██╔════╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
███████╗███████╗██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
╚════██║╚════██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║
███████║███████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
╚══════╝╚══════╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝                                                                                                                                                                                                                                                                                   

"
(
echo "10" ; sleep 1
echo "# Verificando cache do sistema" ; sleep 1
echo "20" ; sleep 1
echo "# Verificando runtimes obsoletas do Flatpak " ; sleep 1
echo "50" ; sleep 1
echo "Verificando pacotes .deb obsoletos" ; sleep 1
echo "75" ; sleep 1
echo "# Pronto para iniciar a limpeza do sistema" ; sleep 1
echo "100" ; sleep 1
) |
zenity --progress \
  --title="Iniciando" \
  --text="Análise..." \
  --percentage=0

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Update."
fi


echo "Seja bem-vindo(a)," $(whoami), "a limpeza automatizada do seu sistema já vai começar."

zenity --question --text "Olá, no próximo passo irá te pedir a senha de usuario, Deseja continuar ?"


## "Definir o numero máximo de revisões de um snap armazenadas pelo sistema após a proxima atualização."
sudo snap set system refresh.retain=2

echo "Removendo runtimes obsoletas do flatpak" 
flatpak uninstall --unused

echo "Removendo dependências obsoletas sistema."
sudo apt-get autoremove

echo "Verificando cache do apt"
sudo du -sh /var/cache/apt

echo "Removendo pacotes .deb obsoletos."
sudo apt-get autoclean

echo "Removendo pacotes obsoletos."
sudo apt-get clean

echo "Limpando o cache de miniaturas."
du -sh ~/.cache/thumbnails

echo "Limpando o cache do Spotify."
sudo rm -rf ~/.cache/spotify/Data/*
sudo rm -rf ~/.cache/spotify/Storage/*

zenity --info --text "Limpeza finalizada !"


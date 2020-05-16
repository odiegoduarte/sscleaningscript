# Shell script SSCleaning para limpeza do sistema.

SSCleaning é um simples shell script que foi criado para fazer a limpeza automatizada do sistema, utilizando comandos do APT.


### Lista de comandos :

 * flatpak uninstall --unused  (Remove runtimes obsoletas do flatpak)
 * sudo apt-get autoremove     (Remove dependências obsoletas sistema)
 * sudo du -sh /var/cache/apt  (Verifica cache do apt)
 * sudo apt-get autoclean      (Remove pacotes .deb obsoletos)
 * sudo apt-get clean          (Remove pacotes .deb obsoletos)
 * du -sh ~/.cache/thumbnails  (Cache de miniaturas.)
 * sudo rm -rf ~/.cache/spotify/Data/*     (Cache do Spotify)
 * sudo rm -rf ~/.cache/spotify/Storage/*  (Cache do Spotify)
  * sudo snap set system refresh.retain=2  (Revisões de um snap armazenadas pelo sistema após a proxima atualização.)  


OBS: Esse shellscript é apenas um projeto pessoal de fim de tarde use por sua conta e risco.



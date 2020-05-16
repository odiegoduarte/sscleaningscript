# Shell script SSCleaning para limpeza do sistema.

SSCleaning é um simples shell script que foi criado para fazer a limpeza automatizada do sistema, utilizando comandos do APT.


### Lista de comandos :
 * sudo snap set system refresh.retain=2
 * flatpak uninstall --unused
 * sudo apt-get autoremove
 * sudo du -sh /var/cache/apt
 * sudo apt-get autoclean
 * sudo apt-get clean
 * du -sh ~/.cache/thumbnails
 * sudo rm -rf ~/.cache/spotify/Data/*
 * sudo rm -rf ~/.cache/spotify/Storage/*  


OBS: Esse shellscript é apenas um projeto pessoal de fim de tarde use por sua conta e risco.

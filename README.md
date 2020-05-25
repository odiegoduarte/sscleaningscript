# Shell script SSCleaning para limpeza do sistema.

SSCleaning é um simples shell script que foi criado para fazer a limpeza automatizada do sistema, utilizando comandos do APT.

<p align="center">
  <img width="460" height="300" src="https://raw.githubusercontent.com/odiegoduarte/sscleaningscript/master/sscleaning.gif">
</p>

### Lista de comandos:

- [x] sudo snap set system refresh.retain=2 (Defini de 3 para 2 versões antigas mantidas)
- [x] flatpak uninstall --unused  (Remove runtimes obsoletas do flatpak)
- [x] sudo apt-get autoremove     (Remove dependências obsoletas sistema)
- [x] sudo du -sh /var/cache/apt  (Verifica cache do apt)
- [x] sudo apt-get autoclean      (Remove pacotes .deb obsoletos)
- [x] sudo apt-get clean          (Remove pacotes .deb obsoletos)
- [x] du -sh ~/.cache/thumbnails  (Cache de miniaturas.)
- [x] sudo rm -rf ~/.cache/spotify/Data/*     (Cache do Spotify)
- [x] sudo rm -rf ~/.cache/spotify/Storage/*  (Cache do Spotify)


OBS: Esse shellscript é apenas um projeto pessoal de fim de tarde use por sua conta e risco.



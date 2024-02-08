<p align="center">
  <img width="922" height="257" src="/images/SSCleaning.png">
</p>

<p align="center">
  <img width="813" height="526" src="/images/sscleaningv5.png">
</p>


### Lista de comandos:

|comandos | Descrição |
| ---- | ---- |
| snap set system refresh.retain=2 | Defini de 3 para 2 versões antigas mantidas |
| flatpak uninstall --unused | Remove runtimes obsoletas do flatpak |
| apt-get autoremove | Remove dependências obsoletas sistema |
| du -sh /var/cache/apt | Verifica cache do apt |
| apt-get autoclean | Remove pacotes .deb obsoletos |
| sudo apt-get clean | Remove pacotes .deb obsoletos |
| du -sh ~/.cache/thumbnails | Verifica cache miniaturas |
| rm -rf ~/.cache/thumbnails/* | Apaga cache miniaturas |
| rm -rf ~/.cache/spotify/Data/* | Apaga cache Spotify |
| rm -rf ~/.cache/spotify/Storage/* | Apaga cache Spotify |

### Referências

- [Ubuntu Manpage apt command-line interface](https://manpages.ubuntu.com/manpages/focal/man8/apt.8.html)
- [Operações básicas de gestão de pacotes](https://www.debian.org/doc/manuals/debian-reference/ch02.pt.html#_basic_package_management_operations)
- [Ubuntu Beginners/BashScripting](https://help.ubuntu.com/community/Beginners/BashScripting)
- [Introdução à programação Shell](http://www.faqs.org/docs/air/tsshell.html)
- [Programando em shell script](http://www.devin.com.br/shell_script/)
- [Whiptail Ubuntu Manual](http://manpages.ubuntu.com/manpages/focal/man1/whiptail.1.html)
- [Bash Reference Manual](https://devdocs.io/bash/)
- [Shell Scripting Tutorial](https://www.shellscript.sh/)
- [Whiptail Wiki](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail)


------------------------------
>*OBS: Esse shellscript é apenas um projeto pessoal de fim de tarde use por sua conta e risco.*
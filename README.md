# arch
This is where you can find scripts and configuration files for the WIN10-ARCH epitech dump

## Summary:
  * Introduction
  * First boot
  * Maintenance
  * Package managing
  * Troubleshooting

## Introduction
This is a non official documentation about the archlinux distribution usage. Avanced users will not be bored and are please to contact me for additionnals info if needed.
First of all, before starting using arch, there is a few things to know.
  * Archlinux is a rolling release distribution (cf https://fr.wikipedia.org/wiki/Rolling_release) and that means you are going to make a lot of updates and reboot your system very often.
  * The Arch Phylosophy is the bible of the archlinux user/developper (cf https://wiki.archlinux.org/index.php/Arch_Linux).
  * Everything is possible on arch. No exceptions. Haters please contact me.
  * Redump is a joke, arch neva broke m8.

So, this is the first release of this dump and it comes with 3 desktops managers differents for matching the main user profiles, but avanced users are free to install the desktop they want.
First, Xmonad is an hardcore lightweight and distraction free tilling window manager for devellopers that consider a mouse as useless and only the true knews.. (here are some usage tips : http://www.howtogeek.com/114728/how-to-use-xmonad-a-tiling-window-manager-for-linux/).

Next, there is openbox, a lightweight desktop highly customizable but provided with the minimum configuration. This is the best way to discover a very large part of linux, a world ruled by configuration files. Openbox can look like xmonad as well as it can look like JARVIS from IronMan, this is up to his config files and implementations (cf http://doc.ubuntu-fr.org/openbox#configuration_avancee) like conky, plank, xbindkeys, etc.

And then, cinnamon, a user friendly interface with a lot of features and settings (cf archwiki or other docs). It is a very intuitive interface with a set of defauts keyboard and mouse shortcuts.

This is a good point to start discover the archlinux simplicity : https://wiki.archlinux.org/index.php/list_of_applications#Taskbars_.2F_panels_.2F_docks.

## First boot


## Maintenance
* searching for a new package

> sudo pacman -Ssq *query* **or** yaourt -Ssq *query*

and with details:
> sudo pacman -Ss *query* **or** yaourt -Ss *query*

* searching for a local package

> sudo pacman -Qsq *query* **or** yaourt -Qsq *query*

and with details:
> sudo pacman -Qs *query* **or** yaourt -Qs *query*

* remove a package

> sudo pacman -R *package* **or** yaourt -R *package*

* remove with its dependancies

> sudo pacman -Rcns *package* **or** yaourt -Rcns *package*

* weekly updates

> sudo pacman -Syu **or** yaourt -Syua

* monthly full updates

> sudo pacman -Syyuu **or** yaourt -Syyuua

* list/remove oprphan packages

list with details:
> sudo pacman -Qdt **or** yaourt -Qdt

list:
> sudo pacman -Qqdt **or** yaourt -Qqdt

remove:
> sudo pacman -R $(pacman -Qqdt) **or** yaourt -R $(yaourt -Qqdt)

remove with dependancies:
> sudo pacman -Rcns $(pacman -Qqdt) **or** yaourt -Rcns $(yaourt -Qqdt)

## Package managing
Pacman is the main and default archlinux package manager and allows you to manage your repositoies and packages. Arch packages are very simlpy stored in 6 main repositories : *core* for boot, net and build packages ; *extra* for media packages ; *community* for any other officially supported package ; *multilib* for 32bit dependancies on a 64bit system ; *testing* for very young/experimental softwares ; *AUR* for any non officially suported packages.

Yaourt is a pacman wrapper that allows you things like managing packages from the AUR repository. This repository contains the world wide web of softwares where you can find every opensource/free projetcs in dev-version and stable version. AUR packages are provided with a buid and an install file that you are free to modify in case of non-compatibility on your system but most of the time you will not have to read them.


Pip is a standalone package manager focused on python v2 and 3 libraries and softs.

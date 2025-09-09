#!/bin/bash

AUCO_PATH=$(pwd)
WALLPATH=/opt/wallpapers/ayu-dark.png
USERHOME=/home/$USER

yayinstall() {
	mkdir ~/git
	git clone https://aur.archlinux.org/yay-bin.git ~/git/yay-bin/
	cd ~/git/yay-bin
	makepkg -si
}

sudo pacman -Syu git curl wget hyprland kitty rofi waybar hyprpaper xdg-desktop-portal-hyprland zsh zoxide fd ripgrep bat gping thefuck tealdeer neovim btop tgpt 7zip jq poppler fzf resvg imagemagick npm wl-clipboard mpv ttf-jetbrains-mono-nerd yazi lsd unzip

yayinstall

yay -Sy oh-my-posh thorne-bin

cd $AUCO_PATH

tldr --update

7z x configs.zip

sudo mkdir $USERHOME/.config

sudo mkdir $USERHOME/.pt

sudo mv -f base.toml $USERHOME/.pt/

sudo mv -f beep.mp3 /opt/

sudo mv -f .zshrc $USERHOME/

sudo mv -f nvim yazi $USERHOME/.config/

sudo mkdir $USERHOME/.config/kitty

sudo mv -f kitty.conf $USERHOME/.config/kitty/

sudo mv -f wallpapers /opt/

sudo sed -i '/^#Color/s/^#//; /^Color/a ILoveCandy' /etc/pacman.conf

sudo mkdir /root/.config

sudo mv -f sddm.conf /etc/

sudo ln -s $USERHOME/.config/nvim /root/.config/nvim

sudo ln -s $USERHOME/.zshrc /root/.zshrc

sudo ln -s $USERHOME/.pt /root/.pt

sudo mv -f where_is_my_sddm_theme /usr/share/sddm/themes/

sudo chown -R root:root /usr/share/sddm/themes/where_is_my_sddm_theme

sudo chmod -R 755 /usr/share/sddm/themes/where_is_my_sddm_theme

sudo rm -rf nvim wallpapers yazi base.toml .zshrc nekoray nekobox beep.mp3 hyprpaper.conf where_is_my_sddm_theme sddm.conf

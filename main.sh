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

sudo pacman -Syu git curl wget hyprland kitty rofi waybar mako swaylock swayidle hyprpaper xdg-desktop-portal-hyprland zsh zoxide fd ripgrep bat gping thefuck tealdeer neovim btop tgpt 7zip jq poppler fzf resvg imagemagick npm wl-clipboard mpv ttf-jetbrains-mono-nerd yazi lsd unzip

yayinstall

yay -Sy oh-my-posh thorne-bin

cd $AUCO_PATH

tldr --update

7z x configs.zip

sudo mkdir $USERHOME/.config

sudo mkdir $USERHOME/.pt

sudo mv base.toml $USERHOME/.pt/

sudo mv beep.mp3 /opt/

sudo mv .zshrc $USERHOME/

sudo mv nvim yazi $USERHOME/.config/

sudo mkdir $USERHOME/.config/kitty

sudo mv kitty.conf $USERHOME/.config/kitty/

sudo mv wallpapers /opt/

sudo rm -rf nvim wallpapers yazi base.toml .zshrc nekoray nekobox beep.mp3

sudo sed -i '/^#Color/s/^#//; /^Color/a ILoveCandy' /etc/pacman.conf

sudo mkdir /root/.config

sudo ln -s $USERHOME/.config/nvim /root/.config/nvim

sudo ln -s $USERHOME/.zshrc /root/.zshrc

sudo ln -s $USERHOME/.pt /root/.pt

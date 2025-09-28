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

sudo pacman -Syu git curl wget hyprland kitty rofi waybar hyprpaper xdg-desktop-portal-hyprland zsh zoxide fd ripgrep bat gping thefuck tealdeer neovim btop tgpt 7zip jq poppler fzf resvg imagemagick npm wl-clipboard mpv ttf-jetbrains-mono-nerd yazi lsd unzip yt-dlp mpd mpc rmpc sox swaync lua love gcc ntfs-3g mupdf gutenprint foomatic-db cups cups-filters cups-pdf ghostscript cliphist wl-copy wl-paste

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

sudo ln -sf $USERHOME/.config/nvim /root/.config/nvim

sudo ln -sf $USERHOME/.zshrc /root/.zshrc

sudo ln -sf $USERHOME/.pt /root/.pt

sudo mv -f waybar $USERHOME/.config/

sudo mv -f hypr $USERHOME/.config/

sudo mv -f where_is_my_sddm_theme /usr/share/sddm/themes/

sudo mv -f cava $USERHOME/.config/

sudo mv -f clipboard ytmd /usr/bin/

sudo chmod +x /usr/bin/ytmd

sudo chmod +x /usr/bin/clipboard

sudo mkdir -p $USERHOME/.config/mpd

sudo mv -f mpd.conf $USERHOME/.config/mpd/

sudo chown -R root:root /usr/share/sddm/themes/where_is_my_sddm_theme

sudo chmod -R 755 /usr/share/sddm/themes/where_is_my_sddm_theme

sudo rm -rf nvim wallpapers yazi base.toml .zshrc beep.mp3 hypr where_is_my_sddm_theme sddm.conf kitty.conf waybar cava mpd.conf ytmd clipboard

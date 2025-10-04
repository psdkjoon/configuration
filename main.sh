#!/bin/bash

AUCO_PATH=$(pwd)
USERHOME=/home/$USER

yayinstall() {
	mkdir ~/git
	git clone https://aur.archlinux.org/yay-bin.git ~/git/yay-bin/
	cd ~/git/yay-bin
	makepkg -si
}

sudo pacman -Syu git curl wget hyprland kitty rofi waybar hyprpaper xdg-desktop-portal-hyprland zsh zoxide fd ripgrep bat gping thefuck tealdeer neovim btop tgpt 7zip jq poppler fzf resvg imagemagick npm wl-clipboard mpv ttf-jetbrains-mono-nerd yazi lsd unzip yt-dlp mpd mpc rmpc sox swaync lua love gcc ntfs-3g mupdf gutenprint foomatic-db cups cups-filters cups-pdf ghostscript cliphist qt5-wayland qt6-wayland fcitx5-im fcitx5-mozc

yayinstall

yay -Sy oh-my-posh thorne-bin aseprite

cd $AUCO_PATH

tldr --update

7z x configs.zip

sudo mkdir $USERHOME/.config

sudo mkdir $USERHOME/.pt

sudo mkdir /root/.config

sudo mkdir $USERHOME/.zsh

sudo mkdir -p $USERHOME/.local/share/fcitx5/themes/

sudo mkdir -p $USERHOME/.config/fcitx5/conf/

sudo mkdir $USERHOME/.config/mpd

sudo mv -f base.toml $USERHOME/.pt/

sudo mv -f beep.mp3 /opt/

sudo mv -f .zshrc $USERHOME/

sudo mv -f profile $USERHOME/.config/fcitx5/

sudo mv -f kitty nvim yazi waybar btop hypr cava lsd $USERHOME/.config/

sudo mv -f tux.png pacman.png /opt/

sudo mv -f catppuccin.zsh $USERHOME/.zsh/

sudo mv -f sddm.conf /etc/

sudo mv -f catppuccin-mocha-mauve $USERHOME/.local/share/fcitx5/themes/

sudo mv -f where_is_my_sddm_theme /usr/share/sddm/themes/

sudo mv -f classicui.conf $USERHOME/.config/fcitx5/conf/

sudo mv -f clipboard ytmd /usr/bin/

sudo mv -f catppuccin-theme-mocha /usr/share/aseprite/data/extensions/

sudo mv -f mpd.conf $USERHOME/.config/mpd/

sudo sed -i '/^#Color/s/^#//; /^Color/a ILoveCandy' /etc/pacman.conf

sudo ln -sf $USERHOME/.config/nvim /root/.config/nvim

sudo ln -sf $USERHOME/.zshrc /root/.zshrc

sudo ln -sf $USERHOME/.pt /root/.pt

sudo chmod +x /usr/bin/ytmd

sudo chmod +x /usr/bin/clipboard

sudo chown -R root:root /usr/share/sddm/themes/where_is_my_sddm_theme

sudo chmod -R 755 /usr/share/sddm/themes/where_is_my_sddm_theme

sudo rm -rf nvim tux.png pacman.png yazi base.toml .zshrc beep.mp3 hypr where_is_my_sddm_theme sddm.conf kitty.conf waybar cava mpd.conf ytmd clipboard catppuccin-theme-mocha btop lsd catppuccin-mocha-mauve classicui.conf

clear

for NUM in {0..10}; do
	echo -ne "\rShuting down in $((10 - NUM))\033[K"
	sleep 1
done

echo -ne "\rBoom!\033[K"
sudo shutdown now

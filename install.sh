#!/bin/bash

sudo pacman -Syu
mkdir /tmp/yay && cd /tmp/yay
curl -OJ 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay'
makepkg -si
cd
rm -rf /tmp/yay

yay --version

git clone --depth=1 https://github.com/gamunu/dotfiles

# install pacman packages
yay -S --needed zsh neovim i3-wm feh i3lock rofi dunst ttf-font-awesome alacritty \
# picom disabled for aur fork
# install xserver
xorg-server xorg-apps xorg-xinit xdotool \
# simple greeter for i3-wm
ly xorg-xauth libxcb \
# XDG autostart
# https://wiki.archlinux.org/title/XDG_Autostart
dex \
# Session lock
# https://wiki.archlinux.org/title/Session_lock
xss-lock \
# Install i2c tools for backlight configuration
ddcutil i2c-tools \
# install applications
spectacle dolphin nm-connection-editor blueman pavucontrol blueman-manager \
okular perl-file-mimeinfo \
# theme and icons and install lxappearance for gtk theme
qt5ct breeze breeze-gtk lxappearance \
# install starship prompt and tools
starship exa bat \
# documenations
tldr \
# install polybar
polybar-scripts-git polybar-git ttf-segoe-ui-variable ttf-nerd-fonts-symbols-mono \
# install greenclip for clipboard management
rofi-greenclip picom-ftlabs-git

# enable services
sudo systemctl enable ly greenclip

# copy home directory files
mkdir -p ~/.config ~/.wallpapers ~/.local/share/fonts
cp -r dotfiles/config ~/.config
cp -r dotfiles/wallpapers ~/.wallpapers
cp -r dotfiles/home/.* ~/
cp -r dotfiles/fonts/* ~/.local/share/fonts

# reload font cache
fc-cache -f -v

# configure xdg settings
xdg-mime default google-chrome-stable.desktop x-scheme-handler/https x-scheme-handler/http
xdg-mime default org.kde.dolphin.desktop inode/directory

# configure fontconfig
mkdir -p $HOME/.config/fontconfig/conf.d

# Enable font slight hinting
ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf $HOME/.config/fontconfig/conf.d

# enable dark theme for qt5
cp /usr/share/color-schemes/BreezeDark.colors ~/.config/kdeglobals
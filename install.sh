#!/bin/bash

create_admin_user() {
	# define user
	local user="$1"

	# check if the user already exists
	if id "$user" >/dev/null 2>&1; then
		echo "User $user already exists"
		return
	else
		echo "Creating user $user"
		# create the user
		useradd -m -G wheel -s /bin/bash "$user" && passwd -d "$user"
		# allow wheel group to run sudo without password
		echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/"$user"
	fi
}

ipacman() {
	pacman -S --needed --noconfirm $@
}

iyay() {
	yay -S --needed --noconfirm $@
}

install_yay(){
	ipacman git base-devel
	# create builder user
	useradd -m -G wheel builder && passwd -d builder
	# allow wheel group to run sudo without password
	mkdir -p /tmp/yay-build && chown -R builder:builder /tmp/yay-build
	su - builder -c "git clone --depth 1 https://aur.archlinux.org/yay-bin.git /tmp/yay-build/yay"
	su - builder -c "cd /tmp/yay-build/yay && makepkg -si --noconfirm"
	rm -rf /tmp/yay-build
}

install_i3() {
	# install pacman packages
	ipacman zsh neovim i3-wm feh i3lock rofi dunst ttf-font-awesome alacritty
	# picom disabled for aur fork
	# install xserver
	ipacman xorg-server xorg-apps xorg-xinit xdotool
	# simple greeter for i3-wm
	ipacman ly xorg-xauth libxcb
	# XDG autostart
	# https://wiki.archlinux.org/title/XDG_Autostart
	ipacman dex
	# Session lock
	# https://wiki.archlinux.org/title/Session_lock
	ipacman xss-lock
	# Install i2c tools for backlight configuration
	ipacman ddcutil i2c-tools
	# install applications
	ipacman spectacle dolphin nm-connection-editor blueman pavucontrol blueman-manager \
	okular perl-file-mimeinfo
	# theme and icons and install lxappearance for gtk theme
	ipacman qt5ct breeze breeze-gtk lxappearance
	# install starship prompt and tools
	ipacman starship exa bat
	# documenations
	ipacman tldr
	# install polybar
	iyay polybar-scripts-git polybar-git ttf-segoe-ui-variable ttf-nerd-fonts-symbols-mono
	# install greenclip for clipboard management
	iyay rofi-greenclip picom-ftlabs-git
}

enable_services() {
	# enable services
	systemctl enable ly greenclip
}

cp_cfg() {
	git clone --depth=1 https://github.com/gamunu/dotfiles /tmp/dotfiles
	cd /tmp
	# copy home directory files
	mkdir -p ~/.config ~/.wallpapers ~/.local/share/fonts
	cp -r dotfiles/config ~/.config
	cp -r dotfiles/wallpapers ~/.wallpapers
	cp -r dotfiles/home/.* ~/
	cp -r dotfiles/fonts/* ~/.local/share/fonts
	# reload font cache
	fc-cache -f

	rm -rf /tmp/dotfiles
}

cfg_xdg() {
	# configure xdg settings
	xdg-mime default google-chrome-stable.desktop x-scheme-handler/https x-scheme-handler/http
	xdg-mime default org.kde.dolphin.desktop inode/directory
}

cfg_fonts() {
	# configure fontconfig
	mkdir -p $HOME/.config/fontconfig/conf.d
	# Enable font slight hinting
	ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf $HOME/.config/fontconfig/conf.d
}

cfg_themes() {
	# configure themes
	# enable dark theme for qt5
	cp /usr/share/color-schemes/BreezeDark.colors ~/.config/kdeglobals
}

create_admin_user "builder"
install_yay
install_i3
enable_services
cfg_xdg
cfg_fonts
cfg_themes
cp_cfg

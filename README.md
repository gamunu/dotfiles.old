# dotfiles

This repository contains dotfiles for customized i3 based desktop environment. The configuration is based on Arch Linux.

- [dotfiles](#dotfiles)
    - [Install](#install)
      - [Install Xserver and i3](#install-xserver-and-i3)
    - [enable greeter](#enable-greeter)
    - [Copy configuration files](#copy-configuration-files)
    - [Make it beautiful](#make-it-beautiful)
      - [Font configuration](#font-configuration)
      - [enable breeze dark theme](#enable-breeze-dark-theme)

**Why use i3 instead of sway?**

Sway is an excellent window manager, but it comes with its own set of challenges, particularly when used on HiDPI screens. One notable issue is the blurriness of fonts when fractional scaling is enabled. As of now, this is a known problem, and there is currently no definitive fix.

Another inconvenience stems from the use of XDG Portals. The constant permission prompts can become particularly tiresome during screen-sharing sessions.

Due to these issues, the most reliable alternative at this time is to stick with i3 running on X11.


### Install

#### Install Xserver and i3

```bash
sudo pacman -S zsh i3-wm feh i3lock rofi dunst ttf-font-awesome alacritty picom \
    # install xserver
    xorg-server xorg-apps xorg-xinit xdotool
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
    tldr 
```

```bash
yay -S polybar-scripts-git polybar-git ttf-segoe-ui-variable ttf-nerd-fonts-symbols-mono \
    # install greenclip for clipboard management
    rofi-greenclip
```

### enable greeter

```bash
sudo systemctl enable ly greenclip
```

### Copy configuration files

```bash
mkdir -p ~/images
cp -r ./config/* ~/.config/
cp -r ./home/.* ~/
cp -r ./images/* ~/images/
```

### Make it beautiful

#### Font configuration

```bash
mkdir -p $HOME/.config/fontconfig/conf.d

# Enable font slight hinting
ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf $HOME/.config/fontconfig/conf.d
```

#### enable breeze dark theme

1. Select Breeze Dark icon theme in qt5ct
2. Run the following command to enable breeze dark theme for applications

```bash
cp /usr/share/color-schemes/BreezeDark.colors ~/.config/kdeglobals
```
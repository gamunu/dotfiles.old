# dotfiles

This repository contains dotfiles for customized i3 based desktop environment. The configuration is based on Arch Linux.

- [dotfiles](#dotfiles)
    - [Install](#install)
      - [Install xserver](#install-xserver)
      - [Install i3](#install-i3)
    - [enable greeter](#enable-greeter)
    - [Install applications](#install-applications)
    - [Copy configuration files](#copy-configuration-files)
    - [Powerline 10k](#powerline-10k)

**Why use i3 instead of sway?**

Sway is an excellent window manager, but it comes with its own set of challenges, particularly when used on HiDPI screens. One notable issue is the blurriness of fonts when fractional scaling is enabled. As of now, this is a known problem, and there is currently no definitive fix.

Another inconvenience stems from the use of XDG Portals. The constant permission prompts can become particularly tiresome during screen-sharing sessions.

Due to these issues, the most reliable alternative at this time is to stick with i3 running on X11.

### Install

#### Install xserver 

```bash
sudo pacman -S xorg-server xorg-apps xorg-xinit xdotool
```
#### Install i3

```bash
sudo pacman -S zsh i3-wm i3lock rofi dunst ttf-font-awesome alacritty picom \
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
    # theme and icons
    qt5ct breeze breeze-gtk
```

```bash
yay -S polybar-scripts-git ttf-segoe-ui-variable
```

### enable greeter

```bash
sudo systemctl enable ly
```

### Install applications

```bash
sudo pacman -S spectacle dolphin nm-connection-editor blueman pavucontrol blueman-manager okular perl-file-mimeinfo
```

### Copy configuration files

```bash
mkdir -p ~/images
cp -r ./config/* ~/.config/
cp -r ./home/.* ~/
cp -r ./images/* ~/images/
```

### Powerline 10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
```
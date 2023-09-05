# dotfiles
Repository containing personal and development environment setup dot files


## I3-wm

### Install

```bash
sudo pacman -S zsh i3-wm i3lock rofi dunst ttf-font-awesome alacritty picom \
    # XDG autostart
    # https://wiki.archlinux.org/title/XDG_Autostart
    dex \
    # Session lock
    # https://wiki.archlinux.org/title/Session_lock
    xss-lock \
    # Install i2c tools for backlight configuration
    ddcutil i2c-tools \
    # network manager
    nm-connection-editor
```

```bash
sudo pacman -S xorg-server xorg-apps xorg-xinit xdotool qt5ct \
    breeze breeze-gtk
```

```bash
yay -S polybar-scripts-git yad \
    ttf-segoe-ui-variable
```

### Install applications

```bash
sudo pacman -S spectacle dolphin blueman pavucontrol blueman-manager okular perl-file-mimeinfo
```

### Copy configuration files

```bash
mkdir -p ~/scripts ~/images
cp -r ./config/* ~/.config/
cp -r ./home/.* ~/
cp -r ./scripts/* ~/scripts/
cp -r ./images/* ~/images/
```

### Powerline 10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
```
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
    # network manager applet
    network-manager-applet nm-connection-editor
```

```bash
sudo pacman -S xorg-server xorg-apps xorg-xinit xdotool qt5ct \
    breeze breeze-gtk
```

```bash
yay -S polybar-scripts-git yad \
    qogir-icon-theme ttf-ligaconsolas-nerd-font ttf-icomoon-feather ttf-iosevka-nerd ttf-segoe-ui-variable
```

### Install applications

```bash
sudo pacman -S spectacle dolphin blueman
```

### Copy configuration files

```bash
mkdir -p ~/scripts ~/images
cp -r ./config/i3-wm/* ~/.config/
cp -r ./home/.* ~/
cp -r ./scripts/* ~/scripts/
cp -r ./images/* ~/images/
```


## Sway

### Displays

In my setup i have another external monitor so we need to tell sway what mode we want to display it in. My monitor is hanging on an arm and its actually rotate 180 degrees to fit better on my desk.

You can find plenty of info in 'man 5 sway' and 'man 5 sway-output'.

Show available displays: swaymsg -t get_outputs


### Waybar

Install font-awesome for icons:

```bash
sudo pacman -S sway dunst waybar wofi alacritty otf-font-awesome
```

### Copy configuration files

```bash
cp -r config/sway-wm/* ~/.config/
```

## fonts
Consolas - Standard Consolas font patched with FiraCode ligatures Plus Nerd Fonts
Ligaturized font - [Consolas Ligaturized](https://github.com/somq/consolas-ligaturized)

### Powerline 10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
```
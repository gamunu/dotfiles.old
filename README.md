# dotfiles
Repository containing personal and development environment setup dot files

## Sway

### Displays

In my setup i have another external monitor so we need to tell sway what mode we want to display it in. My monitor is hanging on an arm and its actually rotate 180 degrees to fit better on my desk.

You can find plenty of info in 'man 5 sway' and 'man 5 sway-output'.

Show available displays: swaymsg -t get_outputs


### Waybar

Install font-awesome for icons:

```bash
sudo pacman -S sway dunst waybar alacritty otf-font-awesome
```

### Copy configuration files

```bash
cp -r config/* ~/.config/
```

## fonts
Consolas - Standard Consolas font patched with FiraCode ligatures Plus Nerd Fonts
Ligaturized font - [Consolas Ligaturized](https://github.com/somq/consolas-ligaturized)

### Powerline 10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
```
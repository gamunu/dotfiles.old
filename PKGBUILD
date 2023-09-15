pkgname=gamunu-dotfiles-git
_reponame=dotfiles
_pkgname=${pkgname%-git}
pkgver=r17.78fed12
pkgrel=1
pkgdesc="My dotfiles"
arch=('any')
url="https://github.com/gamunu/dotfiles"
license=('MIT')
sha256sums=('SKIP')
source=("git+https://github.com/gamunu/dotfiles.git")
depends=('git'
         'efibootmgr'
         'zsh'
         'i3-wm'
         'i3lock'
         'rofi'
         'dunst'
         'alacritty'
         'picom'
         'xorg-server'
         'xorg-xinit'
         'xdotool'
         'ly'
         'xorg-xauth'
         'libxcb'
         'dex'
         'xss-lock'
         'ddcutil'
         'i2c-tools'
         'qt5ct'
         'breeze'
         'breeze-gtk'
         'spectacle'
         'dolphin'
         'nm-connection-editor'
         'blueman'
         'pavucontrol'
         'blueman'
         'okular'
         'perl-file-mimeinfo'
         'lxappearance')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_reponame"

  make install
}

#!/bin/sh
# this script must not be executed as root user
username=$USER
userhome=$(getent passwd $USER | cut -d: -f6)

cd "${userhome}"

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#pure
mkdir .zfunctions
cp /vagrant/prompt_pure_setup .zfunctions
cp /vagrant/async .zfunctions

# copy configuration files
rm -rf .vimrc .xinitrc .Xresources .i3status.conf .i3
cp /vagrant/.zshrc .
cp /vagrant/.vimrc .
cp /vagrant/.xinitrc .
cp /vagrant/.Xresources .
cp /vagrant/.i3status.conf .
cp /vagrant/.hyper.js .
mkdir -p .config/Code/User/
cp /vagrant/code_settings.json .config/Code/User/settings.json
mkdir .i3
cp /vagrant/.i3/config .i3/
# copy wallpaper
mkdir wallpapers
cp /vagrant/wallpaper.jpg wallpapers/
# create work folders
mkdir -p git/

#dos2unix
dos2unix .zshrc
dos2unix .vimrc
dos2unix .xinitrc
dos2unix .Xresources
dos2unix .i3status.conf
dos2unix .i3/config

# set some basic git config settings
git config --global core.editor vim
git config --global user.name "User Full Name"
git config --global user.email "user@email.com"

# install fonts
git clone https://aur.archlinux.org/consolas-font.git
cd consolas-font/
makepkg --noconfirm -si
sudo pacman --noconfirm -U consolas-font-*
cd ../
rm -rf consolas-font/

#instala yay
git clone https://aur.archlinux.org/yay.git
cd yay
echo "Y" | makepkg -si

#instala hyper
yay --noconfirm -S hyper visual-studio-code-bin

echo "vagrant" | chsh -s $(which zsh)
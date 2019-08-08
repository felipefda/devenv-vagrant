#!/bin/sh

#atualiza so
pacman --noconfirm -Syu

# remove guest utils provided by the box (they do not work in the GUI environment)
pacman --noconfirm -R virtualbox-guest-utils-nox

# instala pacotes básicos na vm
pacman --noconfirm -S \
    base-devel go dos2unix vim wget curl git unzip openssh bash-completion \
    xorg-server xorg-xfontsel xorg-xrdb xorg-setxkbmap xorg-xinit xf86-video-intel xf86-input-synaptics xf86-input-libinput \
    i3 slim dmenu \
    ttf-inconsolata terminus-font ttf-fira-code \
    xclip feh rxvt-unicode chromium \
    zsh \
    virtualbox-guest-utils

# enable display manager
systemctl enable slim.service
systemctl start slim.service

#timezone
timedatectl set-timezone America/Sao_Paulo
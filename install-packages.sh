#!/bin/sh

if command -v apt >/dev/null; then
    pm="apt install -y"
    pkgs="gcc make binutils libc6-dev xorriso grub-pc"
elif command -v dnf >/dev/null; then
    pm="dnf install -y"
    pkgs="gcc make binutils glibc-devel xorriso grub2"
elif command -v pacman >/dev/null; then
    pm="pacman -S --noconfirm"
    pkgs="gcc make binutils glibc xorriso grub"
elif command -v zypper >/dev/null; then
    pm="zypper install -y"
    pkgs="gcc make binutils glibc-devel xorriso grub2"
else
    echo "Unsupported distribution"
    exit 1
fi

sudo $pm $pkgs


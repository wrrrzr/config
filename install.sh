#!/bin/env sh

set -e

rm -rf ~/.config/sway ~/.config/kitty ~/.config/nvim ~/.config/swaylock

cp -r sway ~/.config/sway
cp -r swaylock ~/.config/swaylock
cp -r nvim ~/.config/nvim
cp -r kitty ~/.config/kitty
cp .bashrc ~/.bashrc

mkdir -p ~/.local/bin
cp bin/sway-status ~/.local/bin

#!/bin/env sh

set -e

rm -rf ~/.config/sway ~/.config/kitty ~/.config/nvim

cp -r sway ~/.config/sway
cp -r nvim ~/.config/nvim
cp -r kitty ~/.config/kitty
cp .bashrc ~/.bashrc

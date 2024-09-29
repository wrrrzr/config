#!/bin/env sh

rm -rf ~/.config/sway ~/.config/foot ~/.config/nvim

cp -r sway ~/.config/sway
cp -r nvim ~/.config/nvim
cp -r foot ~/.config/foot
cp .bashrc ~/.bashrc

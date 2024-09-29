#!/bin/env sh

set -e

which wget systemctl

rm -rf ~/.config/sway ~/.config/foot ~/.config/nvim

cp -r sway ~/.config/sway
cp -r nvim ~/.config/nvim
cp -r foot ~/.config/foot
cp .bashrc ~/.bashrc

cp spoofdpi.service ~/.config/systemd/user/spoofdpi.service
wget https://github.com/xvzc/SpoofDPI/releases/download/v0.12.0/spoofdpi-linux-amd64.tar.gz
tar xf spoofdpi-linux-amd64.tar.gz
rm spoofdpi-linux-amd64.tar.gz
mv spoofdpi ~
systemctl --user daemon-reload
systemctl --user enable --now spoofdpi.service

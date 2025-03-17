#!/bin/sh

cat << EOF > /etc/NetworkManager/NetworkManager.conf
[main]
dns=none
rc-manager=unmanaged
EOF

systemctl enable --now systemd-resolved
ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

#!/bin/sh

pacman -S --noconfirm zram-generator

cat << EOF > /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram
compression-algorithm = zstd
EOF

systemctl daemon-reload

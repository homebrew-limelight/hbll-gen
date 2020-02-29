#!/bin/bash -e

# TODO: don't force overwrite
apt -o Dpkg::Options::="--force-overwrite" -y --install-suggests install /packages/deps/*.deb
rm -rf /packages/

systemctl mask rpi-eeprom-update
update-ca-certificates -f

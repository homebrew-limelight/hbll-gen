#!/bin/bash -e

# TODO: don't force overwrite
suggests=$(dpkg-deb -I "/packages/deps/opensight_"*".deb" | grep Suggests | sed -e 's/ Suggests: //' -e 's/:.*$//g' -e 's/\n/ /g' -e 's/(/@/g' -e 's/)/@/g' -e 's/ @\([^@]*\)@//g' -e "s/,//g")
apt -o Dpkg::Options::="--force-overwrite" -y install /packages/deps/*.deb $suggests
rm -rf /packages/

systemctl mask rpi-eeprom-update
update-ca-certificates -f

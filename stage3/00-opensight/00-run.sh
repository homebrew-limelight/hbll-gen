#!/bin/bash -e

url="$(curl https://api.github.com/repos/homebrew-limelight/packages/releases/latest | jq -r '.["assets"][]["browser_download_url"]' | grep -v with)"
curl -LO $url
mkdir -p ${ROOTFS_DIR}/packages
tar xf opsi-packages-*.tar.gz -C ${ROOTFS_DIR}/packages

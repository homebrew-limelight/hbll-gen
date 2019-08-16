#!/bin/bash -e

url="$(curl https://api.github.com/repos/homebrew-limelight/packages/releases/latest | jq '.[\"assets\"][][\"browser_download_url\"]' | grep -v with)"
curl -O $url
mkdir packages
tar xf opsi-packages-*.tar.gz -C packages

#!/bin/bash -e

apt -o Dpkg::Options::="--force-overwrite" install -y /packages/*.deb
rm -rf /packages/

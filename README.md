[![Build Status](https://travis-ci.com/opensight-cv/opsi-gen.svg)](https://travis-ci.com/opensight-cv/opsi-gen)
[Release Image Download](https://github.com/opensight-cv/opsi-gen/releases/)
# opsi-gen

_Tool based on [pi-gen](https://github.com/RPi-Distro/pi-gen) used to create OpenSight's derivative Raspbian images_

**The default username is `opsi` and the default password is `opensight`.**

Most everything relevant to building can be in the README for pi-gen. If you simply want to build an image, running `./build-docker.sh` will probably do the job. If you want/need more information, check pi-gen's README.

Changes from pi-gen:
* Localization options, including timezone and keyboard settings are standardized to America/New York
* Stages 4 and 5 are removed in favor for installing OpenSight
* Other normal config options, such as username, hostname, etc, can all be found in the the [config file](https://github.com/opensight-cv/opsi-gen/blob/master/config).


## Dependencies


To install the required dependencies for opsi-gen you should run:

```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl jq
```

The file `depends` contains a list of tools needed.  The format of this
package is `<tool>[:<debian-package>]`.

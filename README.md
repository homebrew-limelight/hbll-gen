# opsi-gen

<p align="center">
    <a href="https://travis-ci.com/opensight-cv/opsi-gen">
        <img src="https://travis-ci.com/opensight-cv/opsi-gen.svg" 
            alt="Build Status"></a>
    <a href="https://discordapp.com/invite/hPqpdsK">
        <img src="https://img.shields.io/discord/573690061720125441?label=Discord&style=flat"
            alt="Join our Server"></a>
    <a href="https://github.com/opensight-cv/opsi-gen/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/opensight-cv/opsi-gen?style=flat"
            alt="MIT License"></a>
</p>

OpenSight is an FRC-focused, free and open source computer vision system targeted specifically for the Raspberry Pi. This repo holds the build scripts for OpenSight's Raspberry Pi image.

[**Click here to go to the main OpenSight source repository.**](https://github.com/opensight-cv/opensight)

[**Click here to go to the packages releases.**](https://github.com/opensight-cv/packages/releases)

[**Click here to go to the Raspberry Pi image releases.**](https://github.com/opensight-cv/opsi-gen/releases)

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

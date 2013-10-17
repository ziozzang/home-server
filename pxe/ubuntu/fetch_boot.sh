#!/bin/bash

OS_TYPE="amd64"
DIST_VER="precise"
MIRROR_HOST="ftp.daum.net"
MIRROR_PATH="/ubuntu/dists/${DIST_VER}/main/installer-${OS_TYPE}/current/images/netboot/ubuntu-installer/${OS_TYPE}/"

wget "http://${MIRROR_HOST}${MIRROR_PATH}initrd.gz"
wget "http://${MIRROR_HOST}${MIRROR_PATH}linux"


exit 0

# ipxe/gpxe
:ubuntu
kernel http://home.jioh.net/pxe/ubuntu-precise-amd64/linux
initrd http://home.jioh.net/pxe/ubuntu-precise-amd64/initrd.gz
imgargs linux auto=true fb=false url=http://foo.bar/xxxxx/preseed.cfg  locale=en_US console-setup/ask_detect=false debian-installer/keymap=us netcfg/choose_interface=eth0 netcfg/get_hostname=ubuntu ipv6.disable=1
boot || goto failed
goto start

#pxelinux.0
prompt 0
timeout 0

default 12.04-amd64

LABEL 12.04-amd64
        MENU LABEL Auto Ubuntu 12.04 preseed (64-bit)
        TEXT HELP
        Automatic installation using preseed. Please tab to set hostname.
        ENDTEXT
        KERNEL linux
        APPEND initrd=initrd.gz auto=true locale=en_US console-setup/ask_detect=false debian-installer/keymap=us netcfg/choose_interface=eth0 netcfg/get_hostname=ubuntu ipv6.disable=1

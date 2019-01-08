#!/bin/bash

ROOT=/mnt/mmredlinux

chroot "$ROOT" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(ROOT chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h

#!/bin/bash

ROOT=/mnt/mmredlinux

mkdir -pv $ROOT/{dev,proc,sys,run}
mknod -m 600 $ROOT/dev/console c 5 1
mknod -m 666 $ROOT/dev/null c 1 3
mount -v --bind /dev $ROOT/dev
mount -vt devpts devpts $ROOT/dev/pts -o gid=5,mode=620
mount -vt proc proc $ROOT/proc
mount -vt sysfs sysfs $ROOT/sys
mount -vt tmpfs tmpfs $ROOT/run
if [ -h $ROOT/dev/shm ]; then
  mkdir -pv $ROOT/$(readlink $ROOT/dev/shm)
fi

#!/bin/bash
echo "Cleaning squashfs directories..."
find squashfs-root/var/log/ -type f -delete
rm -rvf squashfs-root/var/cache/apt/archives/{lock,partial/*}
rm -rvf squashfs-root/var/lib/dhcp/*
rm -rvf squashfs-root/var/tmp/*
rm -rvf squashfs-root/tmp/*
find squashfs-root/root -mindepth 1 -not -name ".bashrc" -and -not -name ".profile" -delete

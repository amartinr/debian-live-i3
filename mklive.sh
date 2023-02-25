#!/bin/bash
echo "Removing old ISO and squashfs images..."
rm -vf debian-live-11.6.0-amd64-custom+nonfree.iso
rm -vf live/live/filesystem.squashfs

. cleanlive.sh

mksquashfs squashfs-root live/live/filesystem.squashfs -b 16384 -comp lzo

xorriso -as mkisofs -r -V 'Debian 11.6 x86_64 custom' -o debian-live-11.6.0-amd64-custom+nonfree.iso -J -J -joliet-long \
        -cache-inodes -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -b isolinux/isolinux.bin \
        -c isolinux/boot.cat -boot-load-size 4 -boot-info-table -no-emul-boot -eltorito-alt-boot \
        -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
        ./live

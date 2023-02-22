#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $(basename $0) <systemd|systemd-ro|qemu|xserver>"
    exit 1
fi

case "$1" in
    systemd)
        sudo systemd-nspawn -a -D squashfs-root -M debian-live-11 --setenv=DISPLAY=:0 --setenv=SHELL=/bin/bash
        #sudo systemd-nspawn -D squashfs-root -M debian-live-11 --setenv=DISPLAY=:0 --setenv=SHELL=/bin/bash --user=root /bin/bash
    ;;
    systemd-ro)
        sudo systemd-nspawn -a -D squashfs-root -M debian-live-11 --setenv=DISPLAY=:0 --setenv=SHELL=/bin/bash --read-only --user=root /bin/bash
    ;;
    qemu)
        qemu-system-x86_64 -enable-kvm -m 4G -cdrom debian-live-11.6.0-amd64-custom+nonfree.iso -display gtk,show-cursor=on -vga virtio
    ;;
    xserver)
        Xephyr -ac -screen 1360x768 -resizeable -reset :1 & sleep 1
        sudo systemd-nspawn -D squashfs-root -M debian-live-11 --setenv=DISPLAY=:1 --setenv=SHELL=/bin/bash --user=root i3
        sleep 2
        pkill Xephyr
    ;;
    *)
        echo "Usage: $(basename $0) <systemd|systemd-ro|qemu|xserver>"
        exit 1
    ;; 
esac

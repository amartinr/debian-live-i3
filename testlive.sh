#!/bin/bash
function usage() {
    echo "Usage: $(basename $0) <systemd|systemd-ro|qemu|xserver>"
    exit 1
}

if [ -z "$1" ]; then
    usage
fi

case "$1" in
    systemd)
        sudo systemd-nspawn -b -D squashfs-root -M debian-live-11 \
            --setenv=DISPLAY=:0 --setenv=SHELL=/bin/bash
    ;;
    systemd-ro)
        sudo systemd-nspawn -b -D squashfs-root -M debian-live-11 \
            --setenv=DISPLAY=:0 --setenv=SHELL=/bin/bash --read-only 
    ;;
    qemu)
        qemu-system-x86_64 -enable-kvm -m 4G \
            -cdrom debian-live-11.6.0-amd64-custom+nonfree.iso \
            -display gtk,show-cursor=on -vga virtio
    ;;
    xserver)
        Xephyr -ac -screen 1360x768 -resizeable -reset :1 & \
        sudo systemd-nspawn -a -D squashfs-root -M debian-live-11 \
            --setenv=DISPLAY=:1.0 --setenv=SHELL=/bin/bash --user=user /etc/X11/Xsession
        pkill Xephyr
    ;;
    *)
        usage
    ;; 
esac

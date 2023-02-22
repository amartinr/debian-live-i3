# Intro
This is a small project to help customise a Debian Live iso-hybrid USB. It's based on Debian Live with support for non-free firmware. You'll need to extract a live squashfs filesystem into squash-root folder to adjust to your liking. I'm using nspawn-systemd to do this. Once you're happy with the changes, rebuild the squashfs filesystem and create a new .iso file with xorriso. Then, you can test this .iso booting it using qemu-kvm, before dumping its content into a thumb drive.

This image is customised to use a Spanish keyboard layout and en-GB.UTF-8 as the system locale. Some of the i3blocks scripts under /usr/local/bin have harcoded strings for the wireless interface.

It also features Nerd and Tamzen fonts with Powerline support for Urxvt and xterm.

![screenshot](https://user-images.githubusercontent.com/22908043/220169855-7f2ba0b1-68b1-4d3f-b126-2af7f3930266.png)

It contains the following software:
* i3
* i3blocks
* i3lock-fancy
* compton
* rofi
* dunst
* firefox-esr
  * Canvas Blocker
  * I Don't Care About Cookies
  * Privacy Badger
  * Decentral Eyes
  * UBlock Origin
  * HTTPS Everywhere

# TODO
* Add persistence
* Remove hardcoded wireless interface names from scripts
* Keep Firefox add-ons updated

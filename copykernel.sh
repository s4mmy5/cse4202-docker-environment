#!/usr/bin/env bash
# FIXME: this file needs to be updated with the proper copies to copy the kernel to the PI (this info can be found in studio2).
#
# This file should be located at /usr/local/bin/copykernel
#
# The script should also accept environment variables for things that should be
# parameterized (like the Pi's IP address, `kernel8`, etc.). But I'm using it
# for myself right now, so I do what I want.

# Bail on errors
set -e

# Mount Pi volumes locally (requires key authentication).
# 1. Create key inside container: `ssh-keygen -t ed25519 -C "build-container"`
# 2. Add key to Pi (run as root on Pi):
#    `mkdir -p /root/.ssh && echo 'KEY_HERE' >> /root/.ssh/authorized_keys`
printf "Mounting Pi volumes\n"
mkdir -p /mnt/raspi-root
sshfs root@$PI_HOST:/ /mnt/raspi-root

# Install kernel modules.
printf "Installing kernel modules\n"
# env PATH=$PATH make KCFLAGS="armv7-a" ARCH=arm CROSS_COMPILE="arm-linux-gnueabihf-" INSTALL_MOD_PATH=/mnt/pi-ext4 modules_install
# rewrite but change INSTALL_MOD_PATH

# Copy kernel and DTBs to Pi.
printf "Copying kernel and DTBs\n"

# Unmount Pi volumes.
printf "Cleaning up\n"
umount /mnt/raspi-root

# Reboot the Pi.
ssh root@$PI_HOST 'sudo reboot'

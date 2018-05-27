#!/usr/bin/env bash

sudo apt-get update
# upgrade for cilium workable 4.10.0-42
apt-cache search --names-only linux-image-4.10.0-42
apt-get install linux-image-4.10.0-42-generic linux-headers-4.10.0-42-generic unzip
# reboot to use new kernel
sudo reboot

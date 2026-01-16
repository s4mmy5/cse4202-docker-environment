# cse4202-docker-environment
Based on Jeff Geerling's [cross compilation environment](https://github.com/geerlingguy/raspberry-pi-pcie-devices/tree/master/extras/cross-compile). 

The purpose of this repo is to achieve the same cross-compilation results as the McKelvey Linux Lab (used in CSE 4202 and CSE 5202) with the added flexibility of a Docker container that can be run on any machine. 

So far I've only tested on macOS 26.2, send a PR if you find an issue with another platform.

## TODO: Steps in need of automation
   2. [ ] Eliminate menuconfig by automatically changing the custom version string and the preemption mode.

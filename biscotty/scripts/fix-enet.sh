#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

ip link set enp2s0 down
ip link set enp2s0 up

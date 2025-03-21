#!/bin/bash

sudo reflector --country 'Netherlands' --protocol https --sort rate --save /etc/pacman.d/mirrorlist
notify-send "Server list updated"

#!/bin/bash
rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive/ &
notify-send "OneDrive Connected"

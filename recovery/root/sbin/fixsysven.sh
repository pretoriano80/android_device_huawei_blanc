#!/sbin/sh
mount -r /vendor
mount -r /system
mount -o rw,remount /vendor
mount -o rw,remount /system
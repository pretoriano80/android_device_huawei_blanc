#!/sbin/sh

relink()
{
	fname=$(basename "$1")
	target="/sbin/$fname"
	sed 's|/system/bin/linker64|///////sbin/linker64|' "$1" > "$target"
	chmod 755 $target
}

relink /vendor/bin/teecd
relink /vendor/bin/hw/android.hardware.gatekeeper@1.0-service
relink /vendor/bin/hw/android.hardware.keymaster@3.0-service
relink /system/bin/vold

umount /s

setprop crypto.ready 1
exit 0
#!/sbin/sh

mkdir /sp
mount -o ro /dev/block/bootdevice/by-name/system /sp

PATCH=$(cat /sp/build.prop | grep ro.build.version.security_patch | cut -d'=' -f2)
setprop ro.build.version.security_patch $PATCH
SDK=$(cat /sp/build.prop | grep ro.build.version.sdk | cut -d'=' -f2)
setprop ro.build.version.sdk $SDK
RELEASE=$(cat /sp/build.prop | grep ro.build.version.release | cut -d'=' -f2)
setprop ro.build.version.release $RELEASE

umount /sp

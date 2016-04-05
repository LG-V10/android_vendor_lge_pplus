#!/system/bin/sh

postboot_prop=`getprop persist.service.postboot.enable`

case "$postboot_prop" in
	1)
        am broadcast -a com.lge.hiddenmenu.POST_BOOT
	;;
esac

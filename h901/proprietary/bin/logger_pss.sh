#!/system/bin/sh

kernel_log_prop=`getprop persist.service.kernel.enable`
vold_prop=`getprop vold.decrypt`
vold_propress=`getprop vold.encrypt_progress`

touch /data/logger/pss.log
chmod 0644 /data/logger/pss.log

case "$kernel_log_prop" in
	6)
	/system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 5120 -n 100
	;;
	5)
        /system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 5120 -n 50
	;;
	4)
        /system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 5120 -n 20
	;;
	3)
        /system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 5120 -n 10
	;;
	2)
        /system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 1024 -n 5
	;;
	1)
    if [ "$vold_prop" = "trigger_default_encryption" ] || [ "$vold_propress" = "0" ] ; then
        touch /cache/encryption_log/pss.log
        chmod 0644 /cache/encryption_log/pss.log
        /system/bin/pss_logger -l -d 180000 -o /cache/encryption_log/pss.log -m 5120 -n 5
    else
        /system/bin/pss_logger -l -d 180000 -o /data/logger/pss.log -m 5120 -n 5
    fi
	;;
esac

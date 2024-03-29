#!/system/bin/sh

setupwizard_log_prop=`getprop persist.service.setwiz.enable`

  touch /data/logger/setup/SetupWizardSystem.log
  chmod 0640 /data/logger/setup/SetupWizardSystem.log
case "$setupwizard_log_prop" in

    1)
       /system/bin/logcat -v time -b system -b main -f /data/logger/setup/SetupWizardSystem.log -s ViewRootImpl:i -s ActivityManager:d SetupWizadTouch:d -n 1 -r 512
    ;;

esac

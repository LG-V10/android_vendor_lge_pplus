#!/system/bin/sh

diag_socket_ip=`getprop service.diag_log.socket.ip`
diag_socket_prop=`getprop service.diag_log.socket.enable`

diag_socket_log -a"$diag_socket_ip" "&"

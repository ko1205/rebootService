#!/usr/bin/bash

is_mounted(){
    mount | awk -v DIR="$1" '{if ($3 == DIR) { exit 0 }} ENDFILE{exit -1}'
}


if is_mounted "/Rnd"; then
    echo "mounted"
else
    nslookup emc.wswg.com
    sleep 5
    mount -a
    systemctl restart tractor-blade.service
fi

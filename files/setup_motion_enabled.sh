#!/bin/bash
available_dir=/etc/motion/camera.available
enabled_dir=/etc/motion/camera.enabled
# cleanup existing links
rm $enabled_dir/*.conf
# check camera device of each available conf
for available_conf in $available_dir/*.conf;do
   device=$(awk '/^ *videodevice/ {print $2}' $available_conf )
   [ -c "$device" ] && { ln -s $available_conf $enabled_dir ; logger -p daemon.info "Enabled configuration $available_conf for device $device" ; }
done
exit 0

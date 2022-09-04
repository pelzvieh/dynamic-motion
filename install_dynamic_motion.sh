#!/bin/bash
install -m 711 -o motion -g motion -d /etc/motion/motion.enabled /etc/motion/motion.available /var/lib/motion/bin
install -m 600 -o motion -g motion -t /etc/motion/motion.available files/camera_example.conf
install -m 600 -o motion -g motion -t /etc/motion files/motion.conf
install -m 500 -o motion -g motion -t /var/lib/motion/bin files/setup_motion_enabled.sh
install -m 755 -o root -g root -d /etc/systemd/system/motion.service.d 
install -m 644 -o root -g root -t /etc/systemd/system/motion.service.d files/01-setup-enabled.conf
install -m 644 -o root -g root -t /etc/udev/rules.d files/30-usb-cameras.rules
systemctl daemon-reload
udevadm control -R
echo Example files installed.
echo Now edit /etc/udev/rules.d/30-usb-cameras.rules to map your USB cameras to semantic device names
echo Then copy /etc/motion/motion.available/camera_example.conf for each of your cameras inside /etc/motion/motion.available
echo "   and adapt the contents, videodevice matching one of your udev rules, filenames distinguishing the files of different cameras."


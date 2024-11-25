#!/bin/bash
mount -o rw,remount /

curl -o /usr/local/bin/time_autoset.sh 'https://raw.githubusercontent.com/gfreemoon/time_autoset/refs/heads/main/time_autoset.sh'
chmod 755 /usr/local/bin/time_autoset.sh
curl -o /etc/systemd/system/time_autoset.service 'https://raw.githubusercontent.com/gfreemoon/time_autoset/refs/heads/main/time_autoset.service'

apt install bc -y --fix-missing

systemctl daemon-reload
systemctl enable time_autoset.service
systemctl start time_autoset.service
systemctl status time_autoset.service

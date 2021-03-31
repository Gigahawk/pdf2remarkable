#!/usr/bin/env bash

set -e

pdf2rm_path=/home/root/.local/share/pdf2rm


mkdir -p $pdf2rm_path
cp pdf2rm.path /etc/systemd/system
cp pdf2rm.service /etc/systemd/system
cp pdf2rm.sh $pdf2rm_path

systemctl daemon-reload
systemctl enable pdf2rm.path

reboot

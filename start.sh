#!/bin/bash -e

/usr/sbin/nslcd
sleep 1
wait `cat /var/run/nslcd/nslcd.pid`

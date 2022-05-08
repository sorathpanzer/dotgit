#!/bin/sh

DBUSLAUNCH=/usr/bin/dbus-launch
eval $($DBUSLAUNCH --exit-with-session --sh-syntax)
exec dwm

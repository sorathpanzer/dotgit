#!/bin/sh

if [ "$(uname)" = "FreeBSD" ]; then
	TEMPERATURE=$(sysctl -a | grep temperature | head -n 1 | awk '{print $2}')
	else
	TEMPERATURE=$(sensors | awk '/Core 0/ {print $3}')
fi

echo "🔥$TEMPERATURE"


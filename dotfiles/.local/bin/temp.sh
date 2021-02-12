#!/bin/bash

TEMPERATURE=$(sensors | awk '/Core 0/ {print $3}')
echo -e "🔥$TEMPERATURE"


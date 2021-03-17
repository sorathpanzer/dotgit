#!/bin/sh

PMUPDATES=$(pacman -Qu | wc -l)
echo -e "📦 $PMUPDATES"


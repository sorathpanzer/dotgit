#!/bin/sh

PMUPDATES=$(pacman -Qu | grep -Fcv '[ignored]')
echo "📦 $PMUPDATES"


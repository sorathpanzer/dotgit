#!/bin/bash

PMUPDATES=$(pacman -Qu | wc -l)
echo -e "📦$PMUPDATES"


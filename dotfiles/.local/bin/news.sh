#!/bin/bash

NEWS=$(newsboat -x print-unread | awk '{ print $1}')
echo -e "📰 $NEWS"


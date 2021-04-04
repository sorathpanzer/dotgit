#!/bin/sh

NEWS=$(newsboat -x print-unread | awk '{ print $1}')
echo "📰 $NEWS"


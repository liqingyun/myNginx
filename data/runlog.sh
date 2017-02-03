#!/bin/bash
#echo `date -v -1d +%Y%m%d`
LOGPATH=/usr/local/nginx/logs/z.com.access.log
BASEPATH=/data/$(date -v -1d +%Y%m)

mkdir -p $BASEPATH

bak=$BASEPATH/$(date -v -1d +%d%H%M).zcom.access.log
#echo $bak

mv $LOGPATH $bak
touch $LOGPATH

kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`

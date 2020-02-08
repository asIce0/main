#!/bin/bash

for a in `seq 0 100`
    do
    {
    ping -c 1 -w 1 192.168.1.$a &> /dev/null     #指定超时间隔
    if [ $? -eq 0 ];then
        echo 192.168.1.$a
    fi }&
done
wait
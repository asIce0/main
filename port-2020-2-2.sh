#!/bin/bash

#echo $1

port=

echo "port is ${port}"

config=/etc/sysconfig/iptables

case "$1" in
"open")
echo "open"
sed -i 's/\#-A INPUT -p tcp -m state --state NEW -m tcp --dport '"${port}"' -j ACCEPT/-A INPUT -p tcp -m state --state NEW -m tcp --dport '"${port}"' -j ACCEPT/' ${config}
systemctl restart iptables
;;
"down")
echo "down"
sed -i 's/-A INPUT -p tcp -m state --state NEW -m tcp --dport '"${port}"' -j ACCEPT/\#-A INPUT -p tcp -m state --state NEW -m tcp --dport '"${port}"' -j ACCEPT/' ${config}
systemctl restart iptables
;;
*)
echo input open or down
exit 0
;;

esac

echo "##
##
##"

#iptables -n -L

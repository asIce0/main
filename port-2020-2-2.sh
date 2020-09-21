#!/bin/bash

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
echo "$0: Usage: sh $0 \(open \| down \)"
	exit 0
;;

esac

echo "##
##
##"
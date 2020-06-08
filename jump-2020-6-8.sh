#!/bin/bash

trapper(){
    trap '' INT QUIT TSTP TERM HUP
}

menu(){
    cat <<-EOF
    =========Host List==========
    1)192.168.10.10
    2)192.168.10.7
    3)exit
    =============================
	EOF
}

host(){
   case "$1" in
   1) ssh 192.168.10.10;;
   2) ssh 192.168.10.7;;
   3|*)exit;;
  esac
}

main(){
  while true
  do
    trapper
    clear
    menu
    read -p "Please select:" num
    host $num
  done
}

main
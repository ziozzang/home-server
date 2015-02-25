#!/bin/bash
# Shell script by Jio L. Jung(ziozzang@gmail.com)

IPT=/sbin/iptables
DOCKER_IF=docker0
iptables-save | grep -v "portford" | iptables-restore

while read line
do
  if [ -n  "${line}" ]; then
    if [ ${line:0:1} != "#" ]; then
      echo "$line"
      IFS='   ' read -a array <<< "$line"
      /sbin/iptables -t nat -A DOCKER -m comment --comment "portford" ! -i ${DOCKER_IF} -p ${array[0]} --dport ${array[1]} -j DNAT --to-destination ${array[3]}:${array[2]}
    fi
  fi
done < ports
